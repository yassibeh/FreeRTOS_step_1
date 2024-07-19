################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/examples/helper/acc_control_helper.c \
../Core/examples/helper/acc_processing_helpers.c 

OBJS += \
./Core/examples/helper/acc_control_helper.o \
./Core/examples/helper/acc_processing_helpers.o 

C_DEPS += \
./Core/examples/helper/acc_control_helper.d \
./Core/examples/helper/acc_processing_helpers.d 


# Each subdirectory must supply rules for building sources it contributes
Core/examples/helper/%.o Core/examples/helper/%.su Core/examples/helper/%.cyclo: ../Core/examples/helper/%.c Core/examples/helper/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-examples-2f-helper

clean-Core-2f-examples-2f-helper:
	-$(RM) ./Core/examples/helper/acc_control_helper.cyclo ./Core/examples/helper/acc_control_helper.d ./Core/examples/helper/acc_control_helper.o ./Core/examples/helper/acc_control_helper.su ./Core/examples/helper/acc_processing_helpers.cyclo ./Core/examples/helper/acc_processing_helpers.d ./Core/examples/helper/acc_processing_helpers.o ./Core/examples/helper/acc_processing_helpers.su

.PHONY: clean-Core-2f-examples-2f-helper

