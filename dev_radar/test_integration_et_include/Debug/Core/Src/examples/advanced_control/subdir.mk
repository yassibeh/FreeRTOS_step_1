################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.c \
../Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.c \
../Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.c \
../Core/Src/examples/advanced_control/example_service_calibration_caching.c \
../Core/Src/examples/advanced_control/example_service_multiple_configurations.c \
../Core/Src/examples/advanced_control/example_service_sensor_disable.c \
../Core/Src/examples/advanced_control/example_service_sensor_hibernate.c \
../Core/Src/examples/advanced_control/example_service_sensor_off.c \
../Core/Src/examples/advanced_control/example_service_subsweeps.c 

OBJS += \
./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.o \
./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.o \
./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.o \
./Core/Src/examples/advanced_control/example_service_calibration_caching.o \
./Core/Src/examples/advanced_control/example_service_multiple_configurations.o \
./Core/Src/examples/advanced_control/example_service_sensor_disable.o \
./Core/Src/examples/advanced_control/example_service_sensor_hibernate.o \
./Core/Src/examples/advanced_control/example_service_sensor_off.o \
./Core/Src/examples/advanced_control/example_service_subsweeps.o 

C_DEPS += \
./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.d \
./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.d \
./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.d \
./Core/Src/examples/advanced_control/example_service_calibration_caching.d \
./Core/Src/examples/advanced_control/example_service_multiple_configurations.d \
./Core/Src/examples/advanced_control/example_service_sensor_disable.d \
./Core/Src/examples/advanced_control/example_service_sensor_hibernate.d \
./Core/Src/examples/advanced_control/example_service_sensor_off.d \
./Core/Src/examples/advanced_control/example_service_subsweeps.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/examples/advanced_control/%.o Core/Src/examples/advanced_control/%.su Core/Src/examples/advanced_control/%.cyclo: ../Core/Src/examples/advanced_control/%.c Core/Src/examples/advanced_control/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-examples-2f-advanced_control

clean-Core-2f-Src-2f-examples-2f-advanced_control:
	-$(RM) ./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.cyclo ./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.d ./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.o ./Core/Src/examples/advanced_control/example_detector_distance_calibration_caching.su ./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.cyclo ./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.d ./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.o ./Core/Src/examples/advanced_control/example_detector_distance_with_iq_data_print.su ./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.cyclo ./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.d ./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.o ./Core/Src/examples/advanced_control/example_detector_presence_multiple_configurations.su ./Core/Src/examples/advanced_control/example_service_calibration_caching.cyclo ./Core/Src/examples/advanced_control/example_service_calibration_caching.d ./Core/Src/examples/advanced_control/example_service_calibration_caching.o ./Core/Src/examples/advanced_control/example_service_calibration_caching.su ./Core/Src/examples/advanced_control/example_service_multiple_configurations.cyclo ./Core/Src/examples/advanced_control/example_service_multiple_configurations.d ./Core/Src/examples/advanced_control/example_service_multiple_configurations.o ./Core/Src/examples/advanced_control/example_service_multiple_configurations.su ./Core/Src/examples/advanced_control/example_service_sensor_disable.cyclo ./Core/Src/examples/advanced_control/example_service_sensor_disable.d ./Core/Src/examples/advanced_control/example_service_sensor_disable.o ./Core/Src/examples/advanced_control/example_service_sensor_disable.su ./Core/Src/examples/advanced_control/example_service_sensor_hibernate.cyclo ./Core/Src/examples/advanced_control/example_service_sensor_hibernate.d ./Core/Src/examples/advanced_control/example_service_sensor_hibernate.o ./Core/Src/examples/advanced_control/example_service_sensor_hibernate.su ./Core/Src/examples/advanced_control/example_service_sensor_off.cyclo ./Core/Src/examples/advanced_control/example_service_sensor_off.d ./Core/Src/examples/advanced_control/example_service_sensor_off.o ./Core/Src/examples/advanced_control/example_service_sensor_off.su ./Core/Src/examples/advanced_control/example_service_subsweeps.cyclo ./Core/Src/examples/advanced_control/example_service_subsweeps.d ./Core/Src/examples/advanced_control/example_service_subsweeps.o ./Core/Src/examples/advanced_control/example_service_subsweeps.su

.PHONY: clean-Core-2f-Src-2f-examples-2f-advanced_control

