################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../miniEstacaoV6.cpp 

CPP_DEPS += \
./miniEstacaoV6.cpp.d 

LINK_OBJ += \
./miniEstacaoV6.cpp.o 


# Each subdirectory must supply rules for building sources it contributes
miniEstacaoV6.cpp.o: ../miniEstacaoV6.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


