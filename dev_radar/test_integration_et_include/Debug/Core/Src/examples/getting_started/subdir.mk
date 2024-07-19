################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/examples/getting_started/example_bring_up.c \
../Core/Src/examples/getting_started/example_control_helper.c \
../Core/Src/examples/getting_started/example_detector_distance.c \
../Core/Src/examples/getting_started/example_detector_presence.c \
../Core/Src/examples/getting_started/example_service.c 

OBJS += \
./Core/Src/examples/getting_started/example_bring_up.o \
./Core/Src/examples/getting_started/example_control_helper.o \
./Core/Src/examples/getting_started/example_detector_distance.o \
./Core/Src/examples/getting_started/example_detector_presence.o \
./Core/Src/examples/getting_started/example_service.o 

C_DEPS += \
./Core/Src/examples/getting_started/example_bring_up.d \
./Core/Src/examples/getting_started/example_control_helper.d \
./Core/Src/examples/getting_started/example_detector_distance.d \
./Core/Src/examples/getting_started/example_detector_presence.d \
./Core/Src/examples/getting_started/example_service.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/examples/getting_started/%.o Core/Src/examples/getting_started/%.su Core/Src/examples/getting_started/%.cyclo: ../Core/Src/examples/getting_started/%.c Core/Src/examples/getting_started/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-examples-2f-getting_started

clean-Core-2f-Src-2f-examples-2f-getting_started:
	-$(RM) ./Core/Src/examples/getting_started/example_bring_up.cyclo ./Core/Src/examples/getting_started/example_bring_up.d ./Core/Src/examples/getting_started/example_bring_up.o ./Core/Src/examples/getting_started/example_bring_up.su ./Core/Src/examples/getting_started/example_control_helper.cyclo ./Core/Src/examples/getting_started/example_control_helper.d ./Core/Src/examples/getting_started/example_control_helper.o ./Core/Src/examples/getting_started/example_control_helper.su ./Core/Src/examples/getting_started/example_detector_distance.cyclo ./Core/Src/examples/getting_started/example_detector_distance.d ./Core/Src/examples/getting_started/example_detector_distance.o ./Core/Src/examples/getting_started/example_detector_distance.su ./Core/Src/examples/getting_started/example_detector_presence.cyclo ./Core/Src/examples/getting_started/example_detector_presence.d ./Core/Src/examples/getting_started/example_detector_presence.o ./Core/Src/examples/getting_started/example_detector_presence.su ./Core/Src/examples/getting_started/example_service.cyclo ./Core/Src/examples/getting_started/example_service.d ./Core/Src/examples/getting_started/example_service.o ./Core/Src/examples/getting_started/example_service.su

.PHONY: clean-Core-2f-Src-2f-examples-2f-getting_started

