################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/examples/helper/acc_control_helper.c \
../Core/Src/examples/helper/acc_processing_helpers.c 

OBJS += \
./Core/Src/examples/helper/acc_control_helper.o \
./Core/Src/examples/helper/acc_processing_helpers.o 

C_DEPS += \
./Core/Src/examples/helper/acc_control_helper.d \
./Core/Src/examples/helper/acc_processing_helpers.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/examples/helper/%.o Core/Src/examples/helper/%.su Core/Src/examples/helper/%.cyclo: ../Core/Src/examples/helper/%.c Core/Src/examples/helper/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-examples-2f-helper

clean-Core-2f-Src-2f-examples-2f-helper:
	-$(RM) ./Core/Src/examples/helper/acc_control_helper.cyclo ./Core/Src/examples/helper/acc_control_helper.d ./Core/Src/examples/helper/acc_control_helper.o ./Core/Src/examples/helper/acc_control_helper.su ./Core/Src/examples/helper/acc_processing_helpers.cyclo ./Core/Src/examples/helper/acc_processing_helpers.d ./Core/Src/examples/helper/acc_processing_helpers.o ./Core/Src/examples/helper/acc_processing_helpers.su

.PHONY: clean-Core-2f-Src-2f-examples-2f-helper

