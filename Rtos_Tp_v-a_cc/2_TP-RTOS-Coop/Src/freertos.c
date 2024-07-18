/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
//TODO ...
#include "mesn_uart.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */
void task1Fn(void const * argument);
void task2Fn(void const * argument);
void task3Fn(void const * argument);
/* USER CODE END FunctionPrototypes */

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
	//TODO:creer taches 1, 2 et 3
	//osThreadDef(TASK1, task1Fn, ..., 0, ...);
	//... = osThreadCreate (osThread(TASK1), NULL);
	osThreadDef(TACHE1,task1Fn,osPriorityLow, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE1), NULL);
	osThreadDef(TACHE2,task2Fn,osPriorityLow, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE2), NULL);
	osThreadDef(TACHE3,task3Fn,osPriorityLow, 0,configMINIMAL_STACK_SIZE);
	osThreadCreate (osThread(TACHE3), NULL);
//nom de la fct sans ()


  /* USER CODE END RTOS_THREADS */

}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
/* task1Fn function */
void task1Fn(void const * argument)
{
	uint32_t i=0;
	//uint32_t start = HAL_GetTick();

  /* Infinite loop */
	for(;;){
	// envoi d un message sur l UART
	MESN_UART_PutString_Poll((uint8_t * )"\r\nTask1#");
	// attente qlq milli-secondes
	//for(i=0;i<100000;i++);
	//while((HAL_GetTick()-start)<10);
	//osThreadYield();
	osDelay(500);
	}
}

/* task2Fn function */
void task2Fn(void const * argument)
{

	uint32_t i=0;


	  /* Infinite loop */
		for(;;){
		// envoi d un message sur l UART
		MESN_UART_PutString_Poll((uint8_t*)"\r\nTask2#####");
		// attente qlq milli-secondes
		//for(i=0;i<100000;i++);
		//osThreadYield();
		osDelay( 1000 );
		}

}

/* task3Fn function */
void task3Fn(void const * argument)
{

	uint32_t i=0 ;


	  /* Infinite loop */
		for(;;){
		// envoi d un message sur l UART
		MESN_UART_PutString_Poll((uint8_t * )"\r\nTask3##############");
		// attente qlq milli-secondes
		osDelay(3000);
		/*for(i=0;i<100000;i++);
		osThreadYield();
		*/}
}

/* USER CODE END Application */

// fonction crocher de idle hook
void vApplicationIdleHook(void){
	MESN_UART_PutString_Poll((uint8_t * )" IDLE u choose ");
	// une restriction il ne faut surtout pas apeller une fct bloaquante !!!!!!!!!!!!!!!!!!!!!!!!!!
	// ecrire i

}
