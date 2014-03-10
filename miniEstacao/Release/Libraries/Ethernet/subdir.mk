################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Dhcp.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Dns.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Ethernet.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetClient.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetServer.cpp \
/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetUdp.cpp 

CPP_DEPS += \
./Libraries/Ethernet/Dhcp.cpp.d \
./Libraries/Ethernet/Dns.cpp.d \
./Libraries/Ethernet/Ethernet.cpp.d \
./Libraries/Ethernet/EthernetClient.cpp.d \
./Libraries/Ethernet/EthernetServer.cpp.d \
./Libraries/Ethernet/EthernetUdp.cpp.d 

LINK_OBJ += \
./Libraries/Ethernet/Dhcp.cpp.o \
./Libraries/Ethernet/Dns.cpp.o \
./Libraries/Ethernet/Ethernet.cpp.o \
./Libraries/Ethernet/EthernetClient.cpp.o \
./Libraries/Ethernet/EthernetServer.cpp.o \
./Libraries/Ethernet/EthernetUdp.cpp.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/Ethernet/Dhcp.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Dhcp.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/Dns.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Dns.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/Ethernet.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/Ethernet.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/EthernetClient.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetClient.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/EthernetServer.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetServer.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

Libraries/Ethernet/EthernetUdp.cpp.o: /home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/EthernetUdp.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -MMD -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=152    -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/cores/arduino" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/variants/mega" -I"/home/jose/Arduino/libraries/aJson" -I"/home/jose/Arduino/libraries/aJson/utility" -I"/home/jose/Arduino/libraries/DHT" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Ethernet/utility" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/SPI" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire" -I"/home/jose/bin/arduino-1.5.2/hardware/arduino/avr/libraries/Wire/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


