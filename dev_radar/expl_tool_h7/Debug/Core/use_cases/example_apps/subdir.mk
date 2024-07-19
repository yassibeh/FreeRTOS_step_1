################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/use_cases/example_apps/example_hand_motion_detection.c \
../Core/use_cases/example_apps/example_hand_motion_detection_main.c \
../Core/use_cases/example_apps/example_surface_velocity.c \
../Core/use_cases/example_apps/example_vibration.c \
../Core/use_cases/example_apps/example_waste_level.c \
../Core/use_cases/example_apps/example_waste_level_main.c 

OBJS += \
./Core/use_cases/example_apps/example_hand_motion_detection.o \
./Core/use_cases/example_apps/example_hand_motion_detection_main.o \
./Core/use_cases/example_apps/example_surface_velocity.o \
./Core/use_cases/example_apps/example_vibration.o \
./Core/use_cases/example_apps/example_waste_level.o \
./Core/use_cases/example_apps/example_waste_level_main.o 

C_DEPS += \
./Core/use_cases/example_apps/example_hand_motion_detection.d \
./Core/use_cases/example_apps/example_hand_motion_detection_main.d \
./Core/use_cases/example_apps/example_surface_velocity.d \
./Core/use_cases/example_apps/example_vibration.d \
./Core/use_cases/example_apps/example_waste_level.d \
./Core/use_cases/example_apps/example_waste_level_main.d 


# Each subdirectory must supply rules for building sources it contributes
Core/use_cases/example_apps/%.o Core/use_cases/example_apps/%.su Core/use_cases/example_apps/%.cyclo: ../Core/use_cases/example_apps/%.c Core/use_cases/example_apps/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-use_cases-2f-example_apps

clean-Core-2f-use_cases-2f-example_apps:
	-$(RM) ./Core/use_cases/example_apps/example_hand_motion_detection.cyclo ./Core/use_cases/example_apps/example_hand_motion_detection.d ./Core/use_cases/example_apps/example_hand_motion_detection.o ./Core/use_cases/example_apps/example_hand_motion_detection.su ./Core/use_cases/example_apps/example_hand_motion_detection_main.cyclo ./Core/use_cases/example_apps/example_hand_motion_detection_main.d ./Core/use_cases/example_apps/example_hand_motion_detection_main.o ./Core/use_cases/example_apps/example_hand_motion_detection_main.su ./Core/use_cases/example_apps/example_surface_velocity.cyclo ./Core/use_cases/example_apps/example_surface_velocity.d ./Core/use_cases/example_apps/example_surface_velocity.o ./Core/use_cases/example_apps/example_surface_velocity.su ./Core/use_cases/example_apps/example_vibration.cyclo ./Core/use_cases/example_apps/example_vibration.d ./Core/use_cases/example_apps/example_vibration.o ./Core/use_cases/example_apps/example_vibration.su ./Core/use_cases/example_apps/example_waste_level.cyclo ./Core/use_cases/example_apps/example_waste_level.d ./Core/use_cases/example_apps/example_waste_level.o ./Core/use_cases/example_apps/example_waste_level.su ./Core/use_cases/example_apps/example_waste_level_main.cyclo ./Core/use_cases/example_apps/example_waste_level_main.d ./Core/use_cases/example_apps/example_waste_level_main.o ./Core/use_cases/example_apps/example_waste_level_main.su

.PHONY: clean-Core-2f-use_cases-2f-example_apps

