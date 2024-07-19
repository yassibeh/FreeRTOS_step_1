################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/examples/troubleshooting/example_diagnostic_test.c 

OBJS += \
./Core/examples/troubleshooting/example_diagnostic_test.o 

C_DEPS += \
./Core/examples/troubleshooting/example_diagnostic_test.d 


# Each subdirectory must supply rules for building sources it contributes
Core/examples/troubleshooting/%.o Core/examples/troubleshooting/%.su Core/examples/troubleshooting/%.cyclo: ../Core/examples/troubleshooting/%.c Core/examples/troubleshooting/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-examples-2f-troubleshooting

clean-Core-2f-examples-2f-troubleshooting:
	-$(RM) ./Core/examples/troubleshooting/example_diagnostic_test.cyclo ./Core/examples/troubleshooting/example_diagnostic_test.d ./Core/examples/troubleshooting/example_diagnostic_test.o ./Core/examples/troubleshooting/example_diagnostic_test.su

.PHONY: clean-Core-2f-examples-2f-troubleshooting

