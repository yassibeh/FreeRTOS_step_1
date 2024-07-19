################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.c \
../Core/Src/integration/acc_integration_log.c \
../Core/Src/integration/acc_integration_stm32.c 

OBJS += \
./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.o \
./Core/Src/integration/acc_integration_log.o \
./Core/Src/integration/acc_integration_stm32.o 

C_DEPS += \
./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.d \
./Core/Src/integration/acc_integration_log.d \
./Core/Src/integration/acc_integration_stm32.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/integration/%.o Core/Src/integration/%.su Core/Src/integration/%.cyclo: ../Core/Src/integration/%.c Core/Src/integration/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-integration

clean-Core-2f-Src-2f-integration:
	-$(RM) ./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.cyclo ./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.d ./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.o ./Core/Src/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.su ./Core/Src/integration/acc_integration_log.cyclo ./Core/Src/integration/acc_integration_log.d ./Core/Src/integration/acc_integration_log.o ./Core/Src/integration/acc_integration_log.su ./Core/Src/integration/acc_integration_stm32.cyclo ./Core/Src/integration/acc_integration_stm32.d ./Core/Src/integration/acc_integration_stm32.o ./Core/Src/integration/acc_integration_stm32.su

.PHONY: clean-Core-2f-Src-2f-integration

