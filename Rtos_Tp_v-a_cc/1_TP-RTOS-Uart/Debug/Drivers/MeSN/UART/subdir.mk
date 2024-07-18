################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/MeSN/UART/mesn_uart.c 

OBJS += \
./Drivers/MeSN/UART/mesn_uart.o 

C_DEPS += \
./Drivers/MeSN/UART/mesn_uart.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/MeSN/UART/%.o Drivers/MeSN/UART/%.su: ../Drivers/MeSN/UART/%.c Drivers/MeSN/UART/subdir.mk
	arm-none-eabi-gcc -c "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-D__weak=__attribute__((weak))' '-D__packed="__attribute__((__packed__))"' -DUSE_HAL_DRIVER -DSTM32L152xE -c -I../Inc -I../Drivers/STM32L1xx_HAL_Driver/Inc -I../Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L1xx/Include -I../Drivers/CMSIS/Include -I../Drivers/MeSN/UART -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-MeSN-2f-UART

clean-Drivers-2f-MeSN-2f-UART:
	-$(RM) ./Drivers/MeSN/UART/mesn_uart.d ./Drivers/MeSN/UART/mesn_uart.o ./Drivers/MeSN/UART/mesn_uart.su

.PHONY: clean-Drivers-2f-MeSN-2f-UART

