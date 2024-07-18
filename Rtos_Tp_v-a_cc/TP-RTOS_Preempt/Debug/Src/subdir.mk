################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/freertos.c \
../Src/gpio.c \
../Src/main.c \
../Src/stm32l1xx_hal_msp.c \
../Src/stm32l1xx_hal_timebase_tim.c \
../Src/stm32l1xx_it.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32l1xx.c 

OBJS += \
./Src/freertos.o \
./Src/gpio.o \
./Src/main.o \
./Src/stm32l1xx_hal_msp.o \
./Src/stm32l1xx_hal_timebase_tim.o \
./Src/stm32l1xx_it.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32l1xx.o 

C_DEPS += \
./Src/freertos.d \
./Src/gpio.d \
./Src/main.d \
./Src/stm32l1xx_hal_msp.d \
./Src/stm32l1xx_hal_timebase_tim.d \
./Src/stm32l1xx_it.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32l1xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L152xE -c -I../Inc -I../Drivers/STM32L1xx_HAL_Driver/Inc -I../Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM3 -I../Drivers/CMSIS/Device/ST/STM32L1xx/Include -I../Drivers/CMSIS/Include -I../Drivers/MeSN/UART -I../Middlewares/Third_Party/TraceRecorder/config -I../Middlewares/Third_Party/TraceRecorder/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/freertos.d ./Src/freertos.o ./Src/freertos.su ./Src/gpio.d ./Src/gpio.o ./Src/gpio.su ./Src/main.d ./Src/main.o ./Src/main.su ./Src/stm32l1xx_hal_msp.d ./Src/stm32l1xx_hal_msp.o ./Src/stm32l1xx_hal_msp.su ./Src/stm32l1xx_hal_timebase_tim.d ./Src/stm32l1xx_hal_timebase_tim.o ./Src/stm32l1xx_hal_timebase_tim.su ./Src/stm32l1xx_it.d ./Src/stm32l1xx_it.o ./Src/stm32l1xx_it.su ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32l1xx.d ./Src/system_stm32l1xx.o ./Src/system_stm32l1xx.su

.PHONY: clean-Src

