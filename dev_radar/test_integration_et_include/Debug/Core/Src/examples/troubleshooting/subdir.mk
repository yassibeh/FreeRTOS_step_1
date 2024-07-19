################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/examples/troubleshooting/example_diagnostic_test.c 

OBJS += \
./Core/Src/examples/troubleshooting/example_diagnostic_test.o 

C_DEPS += \
./Core/Src/examples/troubleshooting/example_diagnostic_test.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/examples/troubleshooting/%.o Core/Src/examples/troubleshooting/%.su Core/Src/examples/troubleshooting/%.cyclo: ../Core/Src/examples/troubleshooting/%.c Core/Src/examples/troubleshooting/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-examples-2f-troubleshooting

clean-Core-2f-Src-2f-examples-2f-troubleshooting:
	-$(RM) ./Core/Src/examples/troubleshooting/example_diagnostic_test.cyclo ./Core/Src/examples/troubleshooting/example_diagnostic_test.d ./Core/Src/examples/troubleshooting/example_diagnostic_test.o ./Core/Src/examples/troubleshooting/example_diagnostic_test.su

.PHONY: clean-Core-2f-Src-2f-examples-2f-troubleshooting

