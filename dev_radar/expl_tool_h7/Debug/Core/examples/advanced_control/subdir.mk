################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/examples/advanced_control/example_detector_distance_calibration_caching.c \
../Core/examples/advanced_control/example_detector_distance_with_iq_data_print.c \
../Core/examples/advanced_control/example_detector_presence_multiple_configurations.c \
../Core/examples/advanced_control/example_service_calibration_caching.c \
../Core/examples/advanced_control/example_service_multiple_configurations.c \
../Core/examples/advanced_control/example_service_sensor_disable.c \
../Core/examples/advanced_control/example_service_sensor_hibernate.c \
../Core/examples/advanced_control/example_service_sensor_off.c \
../Core/examples/advanced_control/example_service_subsweeps.c 

OBJS += \
./Core/examples/advanced_control/example_detector_distance_calibration_caching.o \
./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.o \
./Core/examples/advanced_control/example_detector_presence_multiple_configurations.o \
./Core/examples/advanced_control/example_service_calibration_caching.o \
./Core/examples/advanced_control/example_service_multiple_configurations.o \
./Core/examples/advanced_control/example_service_sensor_disable.o \
./Core/examples/advanced_control/example_service_sensor_hibernate.o \
./Core/examples/advanced_control/example_service_sensor_off.o \
./Core/examples/advanced_control/example_service_subsweeps.o 

C_DEPS += \
./Core/examples/advanced_control/example_detector_distance_calibration_caching.d \
./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.d \
./Core/examples/advanced_control/example_detector_presence_multiple_configurations.d \
./Core/examples/advanced_control/example_service_calibration_caching.d \
./Core/examples/advanced_control/example_service_multiple_configurations.d \
./Core/examples/advanced_control/example_service_sensor_disable.d \
./Core/examples/advanced_control/example_service_sensor_hibernate.d \
./Core/examples/advanced_control/example_service_sensor_off.d \
./Core/examples/advanced_control/example_service_subsweeps.d 


# Each subdirectory must supply rules for building sources it contributes
Core/examples/advanced_control/%.o Core/examples/advanced_control/%.su Core/examples/advanced_control/%.cyclo: ../Core/examples/advanced_control/%.c Core/examples/advanced_control/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-examples-2f-advanced_control

clean-Core-2f-examples-2f-advanced_control:
	-$(RM) ./Core/examples/advanced_control/example_detector_distance_calibration_caching.cyclo ./Core/examples/advanced_control/example_detector_distance_calibration_caching.d ./Core/examples/advanced_control/example_detector_distance_calibration_caching.o ./Core/examples/advanced_control/example_detector_distance_calibration_caching.su ./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.cyclo ./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.d ./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.o ./Core/examples/advanced_control/example_detector_distance_with_iq_data_print.su ./Core/examples/advanced_control/example_detector_presence_multiple_configurations.cyclo ./Core/examples/advanced_control/example_detector_presence_multiple_configurations.d ./Core/examples/advanced_control/example_detector_presence_multiple_configurations.o ./Core/examples/advanced_control/example_detector_presence_multiple_configurations.su ./Core/examples/advanced_control/example_service_calibration_caching.cyclo ./Core/examples/advanced_control/example_service_calibration_caching.d ./Core/examples/advanced_control/example_service_calibration_caching.o ./Core/examples/advanced_control/example_service_calibration_caching.su ./Core/examples/advanced_control/example_service_multiple_configurations.cyclo ./Core/examples/advanced_control/example_service_multiple_configurations.d ./Core/examples/advanced_control/example_service_multiple_configurations.o ./Core/examples/advanced_control/example_service_multiple_configurations.su ./Core/examples/advanced_control/example_service_sensor_disable.cyclo ./Core/examples/advanced_control/example_service_sensor_disable.d ./Core/examples/advanced_control/example_service_sensor_disable.o ./Core/examples/advanced_control/example_service_sensor_disable.su ./Core/examples/advanced_control/example_service_sensor_hibernate.cyclo ./Core/examples/advanced_control/example_service_sensor_hibernate.d ./Core/examples/advanced_control/example_service_sensor_hibernate.o ./Core/examples/advanced_control/example_service_sensor_hibernate.su ./Core/examples/advanced_control/example_service_sensor_off.cyclo ./Core/examples/advanced_control/example_service_sensor_off.d ./Core/examples/advanced_control/example_service_sensor_off.o ./Core/examples/advanced_control/example_service_sensor_off.su ./Core/examples/advanced_control/example_service_subsweeps.cyclo ./Core/examples/advanced_control/example_service_subsweeps.d ./Core/examples/advanced_control/example_service_subsweeps.o ./Core/examples/advanced_control/example_service_subsweeps.su

.PHONY: clean-Core-2f-examples-2f-advanced_control

