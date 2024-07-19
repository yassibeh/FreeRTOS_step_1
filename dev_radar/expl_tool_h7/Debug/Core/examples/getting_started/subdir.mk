################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/examples/getting_started/example_bring_up.c \
../Core/examples/getting_started/example_control_helper.c \
../Core/examples/getting_started/example_detector_distance.c \
../Core/examples/getting_started/example_detector_presence.c \
../Core/examples/getting_started/example_service.c 

OBJS += \
./Core/examples/getting_started/example_bring_up.o \
./Core/examples/getting_started/example_control_helper.o \
./Core/examples/getting_started/example_detector_distance.o \
./Core/examples/getting_started/example_detector_presence.o \
./Core/examples/getting_started/example_service.o 

C_DEPS += \
./Core/examples/getting_started/example_bring_up.d \
./Core/examples/getting_started/example_control_helper.d \
./Core/examples/getting_started/example_detector_distance.d \
./Core/examples/getting_started/example_detector_presence.d \
./Core/examples/getting_started/example_service.d 


# Each subdirectory must supply rules for building sources it contributes
Core/examples/getting_started/%.o Core/examples/getting_started/%.su Core/examples/getting_started/%.cyclo: ../Core/examples/getting_started/%.c Core/examples/getting_started/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-examples-2f-getting_started

clean-Core-2f-examples-2f-getting_started:
	-$(RM) ./Core/examples/getting_started/example_bring_up.cyclo ./Core/examples/getting_started/example_bring_up.d ./Core/examples/getting_started/example_bring_up.o ./Core/examples/getting_started/example_bring_up.su ./Core/examples/getting_started/example_control_helper.cyclo ./Core/examples/getting_started/example_control_helper.d ./Core/examples/getting_started/example_control_helper.o ./Core/examples/getting_started/example_control_helper.su ./Core/examples/getting_started/example_detector_distance.cyclo ./Core/examples/getting_started/example_detector_distance.d ./Core/examples/getting_started/example_detector_distance.o ./Core/examples/getting_started/example_detector_distance.su ./Core/examples/getting_started/example_detector_presence.cyclo ./Core/examples/getting_started/example_detector_presence.d ./Core/examples/getting_started/example_detector_presence.o ./Core/examples/getting_started/example_detector_presence.su ./Core/examples/getting_started/example_service.cyclo ./Core/examples/getting_started/example_service.d ./Core/examples/getting_started/example_service.o ./Core/examples/getting_started/example_service.su

.PHONY: clean-Core-2f-examples-2f-getting_started

