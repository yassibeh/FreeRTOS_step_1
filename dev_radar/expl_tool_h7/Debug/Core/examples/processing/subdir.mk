################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/examples/processing/example_processing_amplitude.c \
../Core/examples/processing/example_processing_coherent_mean.c \
../Core/examples/processing/example_processing_noncoherent_mean.c \
../Core/examples/processing/example_processing_peak_interpolation.c \
../Core/examples/processing/example_processing_static_presence.c \
../Core/examples/processing/example_processing_subtract_adaptive_bg.c 

OBJS += \
./Core/examples/processing/example_processing_amplitude.o \
./Core/examples/processing/example_processing_coherent_mean.o \
./Core/examples/processing/example_processing_noncoherent_mean.o \
./Core/examples/processing/example_processing_peak_interpolation.o \
./Core/examples/processing/example_processing_static_presence.o \
./Core/examples/processing/example_processing_subtract_adaptive_bg.o 

C_DEPS += \
./Core/examples/processing/example_processing_amplitude.d \
./Core/examples/processing/example_processing_coherent_mean.d \
./Core/examples/processing/example_processing_noncoherent_mean.d \
./Core/examples/processing/example_processing_peak_interpolation.d \
./Core/examples/processing/example_processing_static_presence.d \
./Core/examples/processing/example_processing_subtract_adaptive_bg.d 


# Each subdirectory must supply rules for building sources it contributes
Core/examples/processing/%.o Core/examples/processing/%.su Core/examples/processing/%.cyclo: ../Core/examples/processing/%.c Core/examples/processing/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu99 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H753xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-examples-2f-processing

clean-Core-2f-examples-2f-processing:
	-$(RM) ./Core/examples/processing/example_processing_amplitude.cyclo ./Core/examples/processing/example_processing_amplitude.d ./Core/examples/processing/example_processing_amplitude.o ./Core/examples/processing/example_processing_amplitude.su ./Core/examples/processing/example_processing_coherent_mean.cyclo ./Core/examples/processing/example_processing_coherent_mean.d ./Core/examples/processing/example_processing_coherent_mean.o ./Core/examples/processing/example_processing_coherent_mean.su ./Core/examples/processing/example_processing_noncoherent_mean.cyclo ./Core/examples/processing/example_processing_noncoherent_mean.d ./Core/examples/processing/example_processing_noncoherent_mean.o ./Core/examples/processing/example_processing_noncoherent_mean.su ./Core/examples/processing/example_processing_peak_interpolation.cyclo ./Core/examples/processing/example_processing_peak_interpolation.d ./Core/examples/processing/example_processing_peak_interpolation.o ./Core/examples/processing/example_processing_peak_interpolation.su ./Core/examples/processing/example_processing_static_presence.cyclo ./Core/examples/processing/example_processing_static_presence.d ./Core/examples/processing/example_processing_static_presence.o ./Core/examples/processing/example_processing_static_presence.su ./Core/examples/processing/example_processing_subtract_adaptive_bg.cyclo ./Core/examples/processing/example_processing_subtract_adaptive_bg.d ./Core/examples/processing/example_processing_subtract_adaptive_bg.o ./Core/examples/processing/example_processing_subtract_adaptive_bg.su

.PHONY: clean-Core-2f-examples-2f-processing

