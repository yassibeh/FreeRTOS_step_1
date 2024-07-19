################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/use_cases/reference_apps/ref_app_breathing.c \
../Core/Src/use_cases/reference_apps/ref_app_breathing_main.c \
../Core/Src/use_cases/reference_apps/ref_app_parking.c \
../Core/Src/use_cases/reference_apps/ref_app_parking_main.c \
../Core/Src/use_cases/reference_apps/ref_app_smart_presence.c \
../Core/Src/use_cases/reference_apps/ref_app_tank_level.c \
../Core/Src/use_cases/reference_apps/ref_app_touchless_button.c 

OBJS += \
./Core/Src/use_cases/reference_apps/ref_app_breathing.o \
./Core/Src/use_cases/reference_apps/ref_app_breathing_main.o \
./Core/Src/use_cases/reference_apps/ref_app_parking.o \
./Core/Src/use_cases/reference_apps/ref_app_parking_main.o \
./Core/Src/use_cases/reference_apps/ref_app_smart_presence.o \
./Core/Src/use_cases/reference_apps/ref_app_tank_level.o \
./Core/Src/use_cases/reference_apps/ref_app_touchless_button.o 

C_DEPS += \
./Core/Src/use_cases/reference_apps/ref_app_breathing.d \
./Core/Src/use_cases/reference_apps/ref_app_breathing_main.d \
./Core/Src/use_cases/reference_apps/ref_app_parking.d \
./Core/Src/use_cases/reference_apps/ref_app_parking_main.d \
./Core/Src/use_cases/reference_apps/ref_app_smart_presence.d \
./Core/Src/use_cases/reference_apps/ref_app_tank_level.d \
./Core/Src/use_cases/reference_apps/ref_app_touchless_button.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/use_cases/reference_apps/%.o Core/Src/use_cases/reference_apps/%.su Core/Src/use_cases/reference_apps/%.cyclo: ../Core/Src/use_cases/reference_apps/%.c Core/Src/use_cases/reference_apps/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-use_cases-2f-reference_apps

clean-Core-2f-Src-2f-use_cases-2f-reference_apps:
	-$(RM) ./Core/Src/use_cases/reference_apps/ref_app_breathing.cyclo ./Core/Src/use_cases/reference_apps/ref_app_breathing.d ./Core/Src/use_cases/reference_apps/ref_app_breathing.o ./Core/Src/use_cases/reference_apps/ref_app_breathing.su ./Core/Src/use_cases/reference_apps/ref_app_breathing_main.cyclo ./Core/Src/use_cases/reference_apps/ref_app_breathing_main.d ./Core/Src/use_cases/reference_apps/ref_app_breathing_main.o ./Core/Src/use_cases/reference_apps/ref_app_breathing_main.su ./Core/Src/use_cases/reference_apps/ref_app_parking.cyclo ./Core/Src/use_cases/reference_apps/ref_app_parking.d ./Core/Src/use_cases/reference_apps/ref_app_parking.o ./Core/Src/use_cases/reference_apps/ref_app_parking.su ./Core/Src/use_cases/reference_apps/ref_app_parking_main.cyclo ./Core/Src/use_cases/reference_apps/ref_app_parking_main.d ./Core/Src/use_cases/reference_apps/ref_app_parking_main.o ./Core/Src/use_cases/reference_apps/ref_app_parking_main.su ./Core/Src/use_cases/reference_apps/ref_app_smart_presence.cyclo ./Core/Src/use_cases/reference_apps/ref_app_smart_presence.d ./Core/Src/use_cases/reference_apps/ref_app_smart_presence.o ./Core/Src/use_cases/reference_apps/ref_app_smart_presence.su ./Core/Src/use_cases/reference_apps/ref_app_tank_level.cyclo ./Core/Src/use_cases/reference_apps/ref_app_tank_level.d ./Core/Src/use_cases/reference_apps/ref_app_tank_level.o ./Core/Src/use_cases/reference_apps/ref_app_tank_level.su ./Core/Src/use_cases/reference_apps/ref_app_touchless_button.cyclo ./Core/Src/use_cases/reference_apps/ref_app_touchless_button.d ./Core/Src/use_cases/reference_apps/ref_app_touchless_button.o ./Core/Src/use_cases/reference_apps/ref_app_touchless_button.su

.PHONY: clean-Core-2f-Src-2f-use_cases-2f-reference_apps

