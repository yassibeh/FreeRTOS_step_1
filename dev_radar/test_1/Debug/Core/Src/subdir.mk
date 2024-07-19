################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/acc_algorithm.c \
../Core/Src/acc_control_helper.c \
../Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.c \
../Core/Src/acc_integration_log.c \
../Core/Src/acc_integration_stm32.c \
../Core/Src/acc_processing_helpers.c \
../Core/Src/example_bring_up.c \
../Core/Src/example_control_helper.c \
../Core/Src/example_detector_distance.c \
../Core/Src/example_detector_presence.c \
../Core/Src/example_service.c \
../Core/Src/gpio.c \
../Core/Src/main.c \
../Core/Src/spi.c \
../Core/Src/stm32h7xx_hal_msp.c \
../Core/Src/stm32h7xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32h7xx.c \
../Core/Src/usart.c 

OBJS += \
./Core/Src/acc_algorithm.o \
./Core/Src/acc_control_helper.o \
./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.o \
./Core/Src/acc_integration_log.o \
./Core/Src/acc_integration_stm32.o \
./Core/Src/acc_processing_helpers.o \
./Core/Src/example_bring_up.o \
./Core/Src/example_control_helper.o \
./Core/Src/example_detector_distance.o \
./Core/Src/example_detector_presence.o \
./Core/Src/example_service.o \
./Core/Src/gpio.o \
./Core/Src/main.o \
./Core/Src/spi.o \
./Core/Src/stm32h7xx_hal_msp.o \
./Core/Src/stm32h7xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32h7xx.o \
./Core/Src/usart.o 

C_DEPS += \
./Core/Src/acc_algorithm.d \
./Core/Src/acc_control_helper.d \
./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.d \
./Core/Src/acc_integration_log.d \
./Core/Src/acc_integration_stm32.d \
./Core/Src/acc_processing_helpers.d \
./Core/Src/example_bring_up.d \
./Core/Src/example_control_helper.d \
./Core/Src/example_detector_distance.d \
./Core/Src/example_detector_presence.d \
./Core/Src/example_service.d \
./Core/Src/gpio.d \
./Core/Src/main.d \
./Core/Src/spi.d \
./Core/Src/stm32h7xx_hal_msp.d \
./Core/Src/stm32h7xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32h7xx.d \
./Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../cortex_m7_gcc/rss/include -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../cortex_m7_gcc/integration -I../cortex_m7_gcc/examples/getting_started -I../cortex_m7_gcc/examples/helper -I../cortex_m7_gcc/algorithms -I"C:/Users/User1/Desktop/radar_A121/dev/test_1/cortex_m7_gcc/integration" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/main.o: ../Core/Src/main.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/User1/Desktop/radar_A121/dev/test_1/cortex_m7_gcc/rss/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/acc_algorithm.cyclo ./Core/Src/acc_algorithm.d ./Core/Src/acc_algorithm.o ./Core/Src/acc_algorithm.su ./Core/Src/acc_control_helper.cyclo ./Core/Src/acc_control_helper.d ./Core/Src/acc_control_helper.o ./Core/Src/acc_control_helper.su ./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.cyclo ./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.d ./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.o ./Core/Src/acc_hal_integration_stm32cube_xe121_single_sensor.su ./Core/Src/acc_integration_log.cyclo ./Core/Src/acc_integration_log.d ./Core/Src/acc_integration_log.o ./Core/Src/acc_integration_log.su ./Core/Src/acc_integration_stm32.cyclo ./Core/Src/acc_integration_stm32.d ./Core/Src/acc_integration_stm32.o ./Core/Src/acc_integration_stm32.su ./Core/Src/acc_processing_helpers.cyclo ./Core/Src/acc_processing_helpers.d ./Core/Src/acc_processing_helpers.o ./Core/Src/acc_processing_helpers.su ./Core/Src/example_bring_up.cyclo ./Core/Src/example_bring_up.d ./Core/Src/example_bring_up.o ./Core/Src/example_bring_up.su ./Core/Src/example_control_helper.cyclo ./Core/Src/example_control_helper.d ./Core/Src/example_control_helper.o ./Core/Src/example_control_helper.su ./Core/Src/example_detector_distance.cyclo ./Core/Src/example_detector_distance.d ./Core/Src/example_detector_distance.o ./Core/Src/example_detector_distance.su ./Core/Src/example_detector_presence.cyclo ./Core/Src/example_detector_presence.d ./Core/Src/example_detector_presence.o ./Core/Src/example_detector_presence.su ./Core/Src/example_service.cyclo ./Core/Src/example_service.d ./Core/Src/example_service.o ./Core/Src/example_service.su ./Core/Src/gpio.cyclo ./Core/Src/gpio.d ./Core/Src/gpio.o ./Core/Src/gpio.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/spi.cyclo ./Core/Src/spi.d ./Core/Src/spi.o ./Core/Src/spi.su ./Core/Src/stm32h7xx_hal_msp.cyclo ./Core/Src/stm32h7xx_hal_msp.d ./Core/Src/stm32h7xx_hal_msp.o ./Core/Src/stm32h7xx_hal_msp.su ./Core/Src/stm32h7xx_it.cyclo ./Core/Src/stm32h7xx_it.d ./Core/Src/stm32h7xx_it.o ./Core/Src/stm32h7xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32h7xx.cyclo ./Core/Src/system_stm32h7xx.d ./Core/Src/system_stm32h7xx.o ./Core/Src/system_stm32h7xx.su ./Core/Src/usart.cyclo ./Core/Src/usart.d ./Core/Src/usart.o ./Core/Src/usart.su

.PHONY: clean-Core-2f-Src

