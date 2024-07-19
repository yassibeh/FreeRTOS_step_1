################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/algorithms/acc_algorithm.c 

OBJS += \
./Core/Src/algorithms/acc_algorithm.o 

C_DEPS += \
./Core/Src/algorithms/acc_algorithm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/algorithms/%.o Core/Src/algorithms/%.su Core/Src/algorithms/%.cyclo: ../Core/Src/algorithms/%.c Core/Src/algorithms/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-algorithms

clean-Core-2f-Src-2f-algorithms:
	-$(RM) ./Core/Src/algorithms/acc_algorithm.cyclo ./Core/Src/algorithms/acc_algorithm.d ./Core/Src/algorithms/acc_algorithm.o ./Core/Src/algorithms/acc_algorithm.su

.PHONY: clean-Core-2f-Src-2f-algorithms

