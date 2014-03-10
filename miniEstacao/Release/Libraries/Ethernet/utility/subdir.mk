################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility/socket.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility/w5100.cpp 

CPP_DEPS += \
./Libraries/Ethernet/utility/socket.cpp.d \
./Libraries/Ethernet/utility/w5100.cpp.d 

LINK_OBJ += \
./Libraries/Ethernet/utility/socket.cpp.o \
./Libraries/Ethernet/utility/w5100.cpp.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/Ethernet/utility/socket.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility/socket.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/utility/w5100.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility/w5100.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


