################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/use_cases/reference_apps/ref_app_breathing.c \
../Core/use_cases/reference_apps/ref_app_breathing_main.c \
../Core/use_cases/reference_apps/ref_app_parking.c \
../Core/use_cases/reference_apps/ref_app_parking_main.c \
../Core/use_cases/reference_apps/ref_app_smart_presence.c \
../Core/use_cases/reference_apps/ref_app_tank_level.c \
../Core/use_cases/reference_apps/ref_app_touchless_button.c 

OBJS += \
./Core/use_cases/reference_apps/ref_app_breathing.o \
./Core/use_cases/reference_apps/ref_app_breathing_main.o \
./Core/use_cases/reference_apps/ref_app_parking.o \
./Core/use_cases/reference_apps/ref_app_parking_main.o \
./Core/use_cases/reference_apps/ref_app_smart_presence.o \
./Core/use_cases/reference_apps/ref_app_tank_level.o \
./Core/use_cases/reference_apps/ref_app_touchless_button.o 

C_DEPS += \
./Core/use_cases/reference_apps/ref_app_breathing.d \
./Core/use_cases/reference_apps/ref_app_breathing_main.d \
./Core/use_cases/reference_apps/ref_app_parking.d \
./Core/use_cases/reference_apps/ref_app_parking_main.d \
./Core/use_cases/reference_apps/ref_app_smart_presence.d \
./Core/use_cases/reference_apps/ref_app_tank_level.d \
./Core/use_cases/reference_apps/ref_app_touchless_button.d 


# Each subdirectory must supply rules for building sources it contributes
Core/use_cases/reference_apps/%.o Core/use_cases/reference_apps/%.su Core/use_cases/reference_apps/%.cyclo: ../Core/use_cases/reference_apps/%.c Core/use_cases/reference_apps/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-use_cases-2f-reference_apps

clean-Core-2f-use_cases-2f-reference_apps:
	-$(RM) ./Core/use_cases/reference_apps/ref_app_breathing.cyclo ./Core/use_cases/reference_apps/ref_app_breathing.d ./Core/use_cases/reference_apps/ref_app_breathing.o ./Core/use_cases/reference_apps/ref_app_breathing.su ./Core/use_cases/reference_apps/ref_app_breathing_main.cyclo ./Core/use_cases/reference_apps/ref_app_breathing_main.d ./Core/use_cases/reference_apps/ref_app_breathing_main.o ./Core/use_cases/reference_apps/ref_app_breathing_main.su ./Core/use_cases/reference_apps/ref_app_parking.cyclo ./Core/use_cases/reference_apps/ref_app_parking.d ./Core/use_cases/reference_apps/ref_app_parking.o ./Core/use_cases/reference_apps/ref_app_parking.su ./Core/use_cases/reference_apps/ref_app_parking_main.cyclo ./Core/use_cases/reference_apps/ref_app_parking_main.d ./Core/use_cases/reference_apps/ref_app_parking_main.o ./Core/use_cases/reference_apps/ref_app_parking_main.su ./Core/use_cases/reference_apps/ref_app_smart_presence.cyclo ./Core/use_cases/reference_apps/ref_app_smart_presence.d ./Core/use_cases/reference_apps/ref_app_smart_presence.o ./Core/use_cases/reference_apps/ref_app_smart_presence.su ./Core/use_cases/reference_apps/ref_app_tank_level.cyclo ./Core/use_cases/reference_apps/ref_app_tank_level.d ./Core/use_cases/reference_apps/ref_app_tank_level.o ./Core/use_cases/reference_apps/ref_app_tank_level.su ./Core/use_cases/reference_apps/ref_app_touchless_button.cyclo ./Core/use_cases/reference_apps/ref_app_touchless_button.d ./Core/use_cases/reference_apps/ref_app_touchless_button.o ./Core/use_cases/reference_apps/ref_app_touchless_button.su

.PHONY: clean-Core-2f-use_cases-2f-reference_apps

