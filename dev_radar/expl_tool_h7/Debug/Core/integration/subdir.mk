################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.c \
../Core/integration/acc_integration_log.c \
../Core/integration/acc_integration_stm32.c \
../Core/integration/acc_wrap_printf.c \
../Core/integration/printf.c 

OBJS += \
./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.o \
./Core/integration/acc_integration_log.o \
./Core/integration/acc_integration_stm32.o \
./Core/integration/acc_wrap_printf.o \
./Core/integration/printf.o 

C_DEPS += \
./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.d \
./Core/integration/acc_integration_log.d \
./Core/integration/acc_integration_stm32.d \
./Core/integration/acc_wrap_printf.d \
./Core/integration/printf.d 


# Each subdirectory must supply rules for building sources it contributes
Core/integration/%.o Core/integration/%.su Core/integration/%.cyclo: ../Core/integration/%.c Core/integration/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-integration

clean-Core-2f-integration:
	-$(RM) ./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.cyclo ./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.d ./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.o ./Core/integration/acc_hal_integration_stm32cube_xe121_multi_sensor.su ./Core/integration/acc_integration_log.cyclo ./Core/integration/acc_integration_log.d ./Core/integration/acc_integration_log.o ./Core/integration/acc_integration_log.su ./Core/integration/acc_integration_stm32.cyclo ./Core/integration/acc_integration_stm32.d ./Core/integration/acc_integration_stm32.o ./Core/integration/acc_integration_stm32.su ./Core/integration/acc_wrap_printf.cyclo ./Core/integration/acc_wrap_printf.d ./Core/integration/acc_wrap_printf.o ./Core/integration/acc_wrap_printf.su ./Core/integration/printf.cyclo ./Core/integration/printf.d ./Core/integration/printf.o ./Core/integration/printf.su

.PHONY: clean-Core-2f-integration

