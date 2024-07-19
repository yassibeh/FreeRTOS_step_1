################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/examples/processing/example_processing_amplitude.c \
../Core/Src/examples/processing/example_processing_coherent_mean.c \
../Core/Src/examples/processing/example_processing_noncoherent_mean.c \
../Core/Src/examples/processing/example_processing_peak_interpolation.c \
../Core/Src/examples/processing/example_processing_static_presence.c \
../Core/Src/examples/processing/example_processing_subtract_adaptive_bg.c 

OBJS += \
./Core/Src/examples/processing/example_processing_amplitude.o \
./Core/Src/examples/processing/example_processing_coherent_mean.o \
./Core/Src/examples/processing/example_processing_noncoherent_mean.o \
./Core/Src/examples/processing/example_processing_peak_interpolation.o \
./Core/Src/examples/processing/example_processing_static_presence.o \
./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.o 

C_DEPS += \
./Core/Src/examples/processing/example_processing_amplitude.d \
./Core/Src/examples/processing/example_processing_coherent_mean.d \
./Core/Src/examples/processing/example_processing_noncoherent_mean.d \
./Core/Src/examples/processing/example_processing_peak_interpolation.d \
./Core/Src/examples/processing/example_processing_static_presence.d \
./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/examples/processing/%.o Core/Src/examples/processing/%.su Core/Src/examples/processing/%.cyclo: ../Core/Src/examples/processing/%.c Core/Src/examples/processing/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-examples-2f-processing

clean-Core-2f-Src-2f-examples-2f-processing:
	-$(RM) ./Core/Src/examples/processing/example_processing_amplitude.cyclo ./Core/Src/examples/processing/example_processing_amplitude.d ./Core/Src/examples/processing/example_processing_amplitude.o ./Core/Src/examples/processing/example_processing_amplitude.su ./Core/Src/examples/processing/example_processing_coherent_mean.cyclo ./Core/Src/examples/processing/example_processing_coherent_mean.d ./Core/Src/examples/processing/example_processing_coherent_mean.o ./Core/Src/examples/processing/example_processing_coherent_mean.su ./Core/Src/examples/processing/example_processing_noncoherent_mean.cyclo ./Core/Src/examples/processing/example_processing_noncoherent_mean.d ./Core/Src/examples/processing/example_processing_noncoherent_mean.o ./Core/Src/examples/processing/example_processing_noncoherent_mean.su ./Core/Src/examples/processing/example_processing_peak_interpolation.cyclo ./Core/Src/examples/processing/example_processing_peak_interpolation.d ./Core/Src/examples/processing/example_processing_peak_interpolation.o ./Core/Src/examples/processing/example_processing_peak_interpolation.su ./Core/Src/examples/processing/example_processing_static_presence.cyclo ./Core/Src/examples/processing/example_processing_static_presence.d ./Core/Src/examples/processing/example_processing_static_presence.o ./Core/Src/examples/processing/example_processing_static_presence.su ./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.cyclo ./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.d ./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.o ./Core/Src/examples/processing/example_processing_subtract_adaptive_bg.su

.PHONY: clean-Core-2f-Src-2f-examples-2f-processing

