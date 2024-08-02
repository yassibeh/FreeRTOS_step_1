// Copyright (c) Acconeer AB, 2022-2024
// All rights reserved
// This file is subject to the terms and conditions defined in the file
// 'LICENSES/license_acconeer.txt', (BSD 3-Clause License) which is part
// of this source code package.

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "stm32h7xx_hal.h"
#include "acc_definitions_a121.h"
#include "acc_detector_distance.h"
#include "acc_hal_definitions_a121.h"
#include "acc_hal_integration_a121.h"
#include "acc_integration.h"
#include "acc_integration_log.h"
#include "acc_rss_a121.h"
#include "acc_sensor.h"
#include "acc_version.h"
#include "variables.h"

/** \example example_detector_distance.c
 * @brief This is an example on how the Detector Distance API can be used
 * @n
 * This example executes as follows:
 *   - Retrieve HAL integration
 *   - Initialize distance detector resources:
 *     + Create distance detector configuration
 *     + Update configuration settings
 *     + Create Distance detector handle
 *     + Create buffer for detector calibration data
 *     + Create buffer for sensor data
 *   - Create and calibrate the sensor
 *   - Calibrate the detector
 *   - Measure distances with the detector (loop):
 *     + Prepare sensor with the detector
 *     + Measure and wait until a read can be done
 *     + Process measurement and print the result
 *     + Handle "calibration_needed" indication
 *   - Cleanup:
 *     + Destroy detector configuration
 *     + Destroy detector handle
 *     + Destroy sensor data buffer
 *     + Destroy detector calibration data buffer
 */


typedef enum
{
	DISTANCE_PRESET_CONFIG_SHORT_RANGE = 0,
	DISTANCE_PRESET_CONFIG_BALANCED,
	DISTANCE_PRESET_CONFIG_HIGH_ACCURACY,
	DISTANCE_PRESET_CONFIG_LONG_RANGE,
} distance_preset_config_t;


#ifndef NB_RADAR_AVAILABLE
    #define NB_RADAR_AVAILABLE (2U) // Ajuster selon vos besoins moi j'ai 2 radar
#endif

// 2 seconds should be enough even for long ranges and high signal quality
#define SENSOR_TIMEOUT_MS (2000U)


typedef struct
{
	acc_sensor_t                      *sensor;
	acc_detector_distance_config_t    *config;
	acc_detector_distance_handle_t    *handle;
	void                              *buffer;
	uint32_t                          buffer_size;
	uint8_t                           *detector_cal_result_static;
	uint32_t                          detector_cal_result_static_size;
	acc_detector_cal_result_dynamic_t detector_cal_result_dynamic;
} distance_detector_resources_t;


static void cleanup(distance_detector_resources_t *resources);


static void set_config(acc_detector_distance_config_t *detector_config, distance_preset_config_t preset);


static bool initialize_detector_resources(distance_detector_resources_t *resources);


static bool do_sensor_calibration(acc_sensor_t     *sensor,
                                  acc_cal_result_t *sensor_cal_result,
                                  void             *buffer,
                                  uint32_t         buffer_size);


static bool do_full_detector_calibration(distance_detector_resources_t *resources,
                                         const acc_cal_result_t        *sensor_cal_result);


static bool do_detector_calibration_update(distance_detector_resources_t *resources,
                                           const acc_cal_result_t        *sensor_cal_result);


static bool do_detector_get_next(distance_detector_resources_t  *resources,
                                 const acc_cal_result_t         *sensor_cal_result,
                                 acc_detector_distance_result_t *result);


static void print_distance_result(const acc_detector_distance_result_t *result);


int acc_example_detector_distance(int argc, char *argv[]);


int acc_example_detector_distance(int argc, char *argv[])
{
	(void)argc;
	(void)argv;
/******************************************************
*	 Variable pour l'application du boutton poussoir  *
*	 pour changer la configuration					  *
*	 et pour laisser une trace de temps chaque fois   *
*	 on  affiche les resultats:                       *
*******************************************************/
	uint8_t tmp = 0 ;


	distance_detector_resources_t resources[NB_RADAR_AVAILABLE] = { 0 };
	acc_cal_result_t sensor_cal_result[NB_RADAR_AVAILABLE];
	printf("Acconeer software version %s\n", acc_version_get());

	const acc_hal_a121_t *hal = acc_hal_rss_integration_get_implementation();

	if (!acc_rss_hal_register(hal))
	{
		return EXIT_FAILURE;
	}

	for( radar_id = skeep_initial ;radar_id <= skeep_final ;radar_id++ ){
		printf("Initialisation,configuration and calibration of radar %d :\n", radar_id);

		resources[radar_id-1].config = acc_detector_distance_config_create();
		if (resources[radar_id-1].config == NULL)
		{
			printf("acc_detector_distance_config_create() failed\n");
			cleanup(&resources[radar_id-1]);
			return EXIT_FAILURE;
		}
/***************************************************************************************
* Le choix de la confiduration ce fait ici voila les choix possibles pour l'instant :
*	DISTANCE_PRESET_CONFIG_SHORT_RANGE
*	DISTANCE_PRESET_CONFIG_BALANCED
*	DISTANCE_PRESET_CONFIG_HIGH_ACCURACY
*	DISTANCE_PRESET_CONFIG_LONG_RANGE

 ***************************************************************************************/
//		set_config(resources[radar_id-1].config, DISTANCE_PRESET_CONFIG_SHORT_RANGE);
		switch(flag_configuration){
			case 0 :
				tmp = flag_configuration ;
				set_config(resources[radar_id-1].config, DISTANCE_PRESET_CONFIG_BALANCED);
				break;
			case 1 :
				tmp = flag_configuration ;
				set_config(resources[radar_id-1].config, DISTANCE_PRESET_CONFIG_HIGH_ACCURACY);
				break;
		}
		if (!initialize_detector_resources(&resources[radar_id-1]))
		{
			printf("Initializing detector resources failed\n");
			cleanup(&resources[radar_id-1]);
			return EXIT_FAILURE;
		}

		// Print the configuration
		acc_detector_distance_config_log(resources[radar_id-1].handle, resources[radar_id-1].config);

		/* Turn the sensor on */
		acc_hal_integration_sensor_supply_on(radar_id);
		acc_hal_integration_sensor_enable(radar_id);

		resources[radar_id-1].sensor = acc_sensor_create(radar_id);
		if (resources[radar_id-1].sensor == NULL)
		{
			printf("acc_sensor_create() failed\n");
			cleanup(&resources[radar_id-1]);
			return EXIT_FAILURE;
		}

		if (!do_sensor_calibration(resources[radar_id-1].sensor, &sensor_cal_result[radar_id-1], resources[radar_id-1].buffer, resources[radar_id-1].buffer_size))
		{
			printf("Sensor calibration failed\n");
			cleanup(&resources[radar_id-1]);
			return EXIT_FAILURE;
		}

		if (!do_full_detector_calibration(&resources[radar_id-1], &sensor_cal_result[radar_id-1]))
		{
			printf("Detector calibration failed\n");
			cleanup(&resources[radar_id-1]);
			return EXIT_FAILURE;
		}
	}
/********************************************************************************************************************************
* Une fois l'init, config et la calib est faite on commence à prendre les mesures
**************************************************************************************************************************************************/

	while (true)
	{
		acc_detector_distance_result_t result[NB_RADAR_AVAILABLE] = { 0 };

		for( radar_id = skeep_initial ; radar_id <= skeep_final ; radar_id++ ){
			if (!do_detector_get_next(&resources[radar_id-1], &sensor_cal_result[radar_id-1], &result[radar_id-1]))
			{
				printf("Could not get next result\n");
				cleanup(&resources[radar_id-1]);
				return EXIT_FAILURE;
			}

			/* If "calibration needed" is indicated, the sensor needs to be recalibrated and the detector calibration updated */
			if (result[radar_id-1].calibration_needed)
			{
				printf("Sensor recalibration and detector calibration update needed ... \n");

				if (!do_sensor_calibration(resources[radar_id-1].sensor, &sensor_cal_result[radar_id-1], resources[radar_id-1].buffer, resources[radar_id-1].buffer_size))
				{
					printf("Sensor calibration failed\n");
					cleanup(&resources[radar_id-1]);
					return EXIT_FAILURE;
				}

				/* Once the sensor is recalibrated, the detector calibration should be updated and measuring can continue. */
				if (!do_detector_calibration_update(&resources[radar_id-1], &sensor_cal_result[radar_id-1]))
				{
					printf("Detector calibration update failed\n");
					cleanup(&resources[radar_id-1]);
					return EXIT_FAILURE;
				}

				printf("Sensor recalibration and detector calibration update done!\n");
			}
			else
			{
				//printf("Affichage resultat radar %d : \n",radar_id);
				print_distance_result(&result[radar_id-1]);

 				if( result[radar_id-1].num_distances != 0 ){
					// attention je recupère que la distance du premier obstacle :
					buff_radar[radar_id-1].buffer[buff_radar[radar_id-1].indice_W] = result[radar_id-1].distances[0] ;
					buff_radar[radar_id-1].nb_elt++;
					buff_radar[radar_id-1].indice_W++;
					if( buff_radar[radar_id-1].nb_elt ==  NB_RESULTAT_VOULUE ){
						buff_radar[radar_id-1].indice_W = 0 ;
						buff_radar[radar_id-1].nb_elt = 0 ;
					}
				}

				if(tmp!= flag_configuration){
					acc_example_detector_distance(0,NULL);
					tmp = flag_configuration ;
				}
			}
		}
	}

	for( radar_id = skeep_initial ; radar_id <= skeep_final ;radar_id++ ){
		cleanup(&resources[radar_id-1]);
	}
	printf("Done!\n");

	return EXIT_SUCCESS;
}


static void cleanup(distance_detector_resources_t *resources)
{
	acc_hal_integration_sensor_disable(radar_id);
	acc_hal_integration_sensor_supply_off(radar_id);

	acc_detector_distance_config_destroy(resources->config);
	acc_detector_distance_destroy(resources->handle);

	acc_integration_mem_free(resources->buffer);
	acc_integration_mem_free(resources->detector_cal_result_static);

	if (resources->sensor != NULL)
	{
		acc_sensor_destroy(resources->sensor);
	}
}


static void set_config(acc_detector_distance_config_t *detector_config, distance_preset_config_t preset)
{
	// Add configuration of the detector here
	switch (preset)
	{
		case DISTANCE_PRESET_CONFIG_SHORT_RANGE:
			// Add configuration of the detector here
			acc_detector_distance_config_start_set(detector_config, 0.01f);
			acc_detector_distance_config_end_set(detector_config, 0.6f);
			acc_detector_distance_config_max_step_length_set(detector_config, 96U);
			acc_detector_distance_config_max_profile_set(detector_config, ACC_CONFIG_PROFILE_1);
			acc_detector_distance_config_reflector_shape_set(detector_config, ACC_DETECTOR_DISTANCE_REFLECTOR_SHAPE_PLANAR);
			acc_detector_distance_config_peak_sorting_set(detector_config, ACC_DETECTOR_DISTANCE_PEAK_SORTING_CLOSEST);
			acc_detector_distance_config_threshold_method_set(detector_config, ACC_DETECTOR_DISTANCE_THRESHOLD_METHOD_CFAR);
			acc_detector_distance_config_num_frames_recorded_threshold_set(detector_config, 500U);
			acc_detector_distance_config_threshold_sensitivity_set(detector_config, 0.9f);
			acc_detector_distance_config_signal_quality_set(detector_config, 6.0f);
			acc_detector_distance_config_close_range_leakage_cancellation_set(detector_config, true);
			break;

		case DISTANCE_PRESET_CONFIG_BALANCED:
			acc_detector_distance_config_start_set(detector_config, 0.25f);
			acc_detector_distance_config_end_set(detector_config, 3.0f);
			acc_detector_distance_config_max_step_length_set(detector_config, 0U);
			acc_detector_distance_config_max_profile_set(detector_config, ACC_CONFIG_PROFILE_5);
			acc_detector_distance_config_reflector_shape_set(detector_config, ACC_DETECTOR_DISTANCE_REFLECTOR_SHAPE_GENERIC);
			acc_detector_distance_config_peak_sorting_set(detector_config, ACC_DETECTOR_DISTANCE_PEAK_SORTING_STRONGEST);
			acc_detector_distance_config_threshold_method_set(detector_config, ACC_DETECTOR_DISTANCE_THRESHOLD_METHOD_CFAR);
			acc_detector_distance_config_num_frames_recorded_threshold_set(detector_config, 100U);
			acc_detector_distance_config_threshold_sensitivity_set(detector_config, 0.5f);
			acc_detector_distance_config_signal_quality_set(detector_config, 15.0f);
			acc_detector_distance_config_close_range_leakage_cancellation_set(detector_config, false);
			break;

		case DISTANCE_PRESET_CONFIG_HIGH_ACCURACY:
			acc_detector_distance_config_start_set(detector_config, 0.25f);
			acc_detector_distance_config_end_set(detector_config, 3.0f);
			acc_detector_distance_config_max_step_length_set(detector_config, 2U);
			acc_detector_distance_config_max_profile_set(detector_config, ACC_CONFIG_PROFILE_3);
			acc_detector_distance_config_reflector_shape_set(detector_config, ACC_DETECTOR_DISTANCE_REFLECTOR_SHAPE_GENERIC);
			acc_detector_distance_config_peak_sorting_set(detector_config, ACC_DETECTOR_DISTANCE_PEAK_SORTING_STRONGEST);
			acc_detector_distance_config_threshold_method_set(detector_config, ACC_DETECTOR_DISTANCE_THRESHOLD_METHOD_CFAR);
			acc_detector_distance_config_num_frames_recorded_threshold_set(detector_config, 100U);
			acc_detector_distance_config_threshold_sensitivity_set(detector_config, 0.5f);
			acc_detector_distance_config_signal_quality_set(detector_config, 20.0f);
			acc_detector_distance_config_close_range_leakage_cancellation_set(detector_config, false);
			break;
		case DISTANCE_PRESET_CONFIG_LONG_RANGE:
			acc_detector_distance_config_start_set(detector_config, 0.6f);
			acc_detector_distance_config_end_set(detector_config, 24.3f);
			acc_detector_distance_config_max_step_length_set(detector_config, 96U);
			acc_detector_distance_config_max_profile_set(detector_config, ACC_CONFIG_PROFILE_5);
			acc_detector_distance_config_reflector_shape_set(detector_config, ACC_DETECTOR_DISTANCE_REFLECTOR_SHAPE_GENERIC);
			acc_detector_distance_config_peak_sorting_set(detector_config, ACC_DETECTOR_DISTANCE_PEAK_SORTING_STRONGEST);
			acc_detector_distance_config_threshold_method_set(detector_config, ACC_DETECTOR_DISTANCE_THRESHOLD_METHOD_CFAR);
			acc_detector_distance_config_num_frames_recorded_threshold_set(detector_config, 300U);
			acc_detector_distance_config_threshold_sensitivity_set(detector_config, 0.4f);
			acc_detector_distance_config_signal_quality_set(detector_config, 25.0f);
			acc_detector_distance_config_close_range_leakage_cancellation_set(detector_config, true);
			break;
	}
}


static bool initialize_detector_resources(distance_detector_resources_t *resources)
{
	resources->handle = acc_detector_distance_create(resources->config);
	if (resources->handle == NULL)
	{
		printf("acc_detector_distance_create() failed\n");
		return false;
	}

	if (!acc_detector_distance_get_sizes(resources->handle, &(resources->buffer_size), &(resources->detector_cal_result_static_size)))
	{
		printf("acc_detector_distance_get_sizes() failed\n");
		return false;
	}

	resources->buffer = acc_integration_mem_alloc(resources->buffer_size);
	if (resources->buffer == NULL)
	{
		printf("sensor buffer allocation failed\n");
		return false;
	}

	resources->detector_cal_result_static = acc_integration_mem_alloc(resources->detector_cal_result_static_size);
	if (resources->detector_cal_result_static == NULL)
	{
		printf("calibration buffer allocation failed\n");
		return false;
	}

	return true;
}


static bool do_sensor_calibration(acc_sensor_t     *sensor,
                                  acc_cal_result_t *sensor_cal_result,
                                  void             *buffer,
                                  uint32_t         buffer_size)
{
	bool           status              = false;
	bool           cal_complete        = false;
	const uint16_t calibration_retries = 1U;

	// Random disturbances may cause the calibration to fail. At failure, retry at least once.
	for (uint16_t i = 0; !status && (i <= calibration_retries); i++)
	{
		// Reset sensor before calibration by disabling/enabling it
		acc_hal_integration_sensor_disable(radar_id);
		acc_hal_integration_sensor_enable(radar_id);

		do
		{
			status = acc_sensor_calibrate(sensor, &cal_complete, sensor_cal_result, buffer, buffer_size);

			if (status && !cal_complete)
			{
				status = acc_hal_integration_wait_for_sensor_interrupt(radar_id, SENSOR_TIMEOUT_MS);
			}
		} while (status && !cal_complete);
	}

	if (status)
	{
		/* Reset sensor after calibration by disabling/enabling it */
		acc_hal_integration_sensor_disable(radar_id);
		acc_hal_integration_sensor_enable(radar_id);
	}

	return status;
}


static bool do_full_detector_calibration(distance_detector_resources_t *resources,
                                         const acc_cal_result_t        *sensor_cal_result)
{
	bool done = false;
	bool status;

	do
	{
		status = acc_detector_distance_calibrate(resources->sensor,
		                                         resources->handle,
		                                         sensor_cal_result,
		                                         resources->buffer,
		                                         resources->buffer_size,
		                                         resources->detector_cal_result_static,
		                                         resources->detector_cal_result_static_size,
		                                         &resources->detector_cal_result_dynamic,
		                                         &done);

		if (status && !done)
		{
			status = acc_hal_integration_wait_for_sensor_interrupt(radar_id, SENSOR_TIMEOUT_MS);
		}
	} while (status && !done);

	return status;
}


static bool do_detector_calibration_update(distance_detector_resources_t *resources,
                                           const acc_cal_result_t        *sensor_cal_result)
{
	bool done = false;
	bool status;

	do
	{
		status = acc_detector_distance_update_calibration(resources->sensor,
		                                                  resources->handle,
		                                                  sensor_cal_result,
		                                                  resources->buffer,
		                                                  resources->buffer_size,
		                                                  &resources->detector_cal_result_dynamic,
		                                                  &done);

		if (status && !done)
		{
			status = acc_hal_integration_wait_for_sensor_interrupt(radar_id, SENSOR_TIMEOUT_MS);
		}
	} while (status && !done);

	return status;
}


static bool do_detector_get_next(distance_detector_resources_t  *resources,
                                 const acc_cal_result_t         *sensor_cal_result,
                                 acc_detector_distance_result_t *result)
{
	bool result_available = false;

	do
	{
		if (!acc_detector_distance_prepare(resources->handle, resources->config, resources->sensor, sensor_cal_result, resources->buffer,
		                                   resources->buffer_size))
		{
			printf("acc_detector_distance_prepare() failed\n");
			return false;
		}

		if (!acc_sensor_measure(resources->sensor))
		{
			printf("acc_sensor_measure() failed\n");
			return false;
		}
		if (!acc_hal_integration_wait_for_sensor_interrupt(radar_id, SENSOR_TIMEOUT_MS))
		{
			printf("Sensor interrupt timeout\n");
			return false;
		}


		if (!acc_sensor_read(resources->sensor, resources->buffer, resources->buffer_size))
		{
			printf("acc_sensor_read() failed\n");
			return false;
		}

		if (!acc_detector_distance_process(resources->handle, resources->buffer, resources->detector_cal_result_static,
		                                   &resources->detector_cal_result_dynamic,
		                                   &result_available, result))
		{
			printf("acc_detector_distance_process() failed\n");
			return false;
		}
	} while (!result_available);

	return true;
}


static void print_distance_result(const acc_detector_distance_result_t *result)
{	static uint8_t tmp = 0;
//	uint8_t i= 0;
	static uint32_t intermediaire[3] ;
	static uint16_t ms = 0;
	static uint8_t sec = 0 ;
	static uint8_t min = 0 ;
	static uint8_t heure = 0 ;

	if(tmp == 0) intermediaire[0] = HAL_GetTick() ;
	if(tmp == 1) intermediaire[1] = HAL_GetTick() ;
	if(tmp >= 2){
		intermediaire[0] = intermediaire[1] ;
		intermediaire[1] = HAL_GetTick() ;
	}
	if(tmp>=1) intermediaire[2] = (intermediaire[1]-intermediaire[0]) ;
	ms = ms + (uint16_t)intermediaire[2] ;
	if( ms > 1000 ){
		ms = ms -1000;
		if( sec < 60 ) sec++;
		if(	sec == 60 ){
			min++;
			sec=0;
		}
		if( min == 60 ){
			heure++;
			min = 0;
		}
	}else if( ms == 1000 ){
		ms = 0;
		if( sec < 60 ) sec++;
		if( min >= 60 ){
			min++;
			sec=0;
		}
		if( min == 60 ){
			heure++;
			min = 0;
		}
	}

	tmp++;

//	printf("%d:%d:%d:%d; %d detected, distances",heure,min,sec,ms,result->num_distances);
	if (result->num_distances > 0)
	{
//		printf(": ");
//		printf("%" PRIfloat , ACC_LOG_FLOAT_TO_INTEGER(result->distances[0]));
		for (uint8_t i = 0; i < result->num_distances; i++)
		{
//			 printf("%" PRIfloat , ACC_LOG_FLOAT_TO_INTEGER(result->distances[0]));
//			if(i == (result->num_distances -1)) printf("%" PRIfloat " m ;", ACC_LOG_FLOAT_TO_INTEGER(result->distances[0]));
			if(i == (result->num_distances -1)) printf("%" PRIfloat , ACC_LOG_FLOAT_TO_INTEGER(result->distances[i]));
			else printf("%" PRIfloat " m ,", ACC_LOG_FLOAT_TO_INTEGER(result->distances[i]));
		}
	}

	printf("\n");
}

