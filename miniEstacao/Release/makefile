################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include arduino/core/subdir.mk
-include Libraries/aJson/utility/subdir.mk
-include Libraries/aJson/subdir.mk
-include Libraries/Wire/utility/subdir.mk
-include Libraries/Wire/subdir.mk
-include Libraries/SPI/subdir.mk
-include Libraries/Ethernet/utility/subdir.mk
-include Libraries/Ethernet/subdir.mk
-include Libraries/DHT/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
AR += \
/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/arduino.ar \

ELF += \
miniEstacaoV6.elf \

EEP += \
miniEstacaoV6.eep \

FLASH_IMAGE += \
miniEstacaoV6.hex \


# All Target
all: miniEstacaoV6

# Tool invocations
miniEstacaoV6: $(FLASH_IMAGE)
	@echo 'Building target: $@'
	@echo 'Printing size:'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-size" -A "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.hex"
	@echo 'Finished building target: $@'
	@echo ' '

/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/arduino.ar: $(AR_OBJ)
	@echo 'Starting archiver'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-ar" rcs "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/arduino.ar"   $(AR_OBJ)
	@echo 'Finished building: $@'
	@echo ' '

miniEstacaoV6.elf: $(LINK_OBJ) $(AR)
	@echo 'Starting combiner'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-gcc" -Os -Wl,--gc-sections -mmcu=atmega2560 -o "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.elf"   $(LINK_OBJ) $(AR)  "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/arduino.ar" "-L/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release" -lm
	@echo 'Finished building: $@'
	@echo ' '

miniEstacaoV6.eep: $(ELF)
	@echo 'Create eeprom image'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.elf" "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.eep"
	@echo 'Finished building: $@'
	@echo ' '

miniEstacaoV6.hex: $(EEP)
	@echo 'Create Flash image (ihex format)'
	"/home/jose/bin/arduino-1.5.2/hardware/tools/avr/bin/avr-objcopy" -O ihex -R .eeprom "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.elf" "/home/jose/Documentos/Projetos/Arduino/Programas/workspace/miniEstacaoV6/Release/miniEstacaoV6.hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(ELF)$(C++_DEPS)$(AR)$(C_DEPS)$(CC_DEPS)$(FLASH_IMAGE)$(AR_OBJ)$(CPP_DEPS)$(LINK_OBJ)$(EEP)$(CXX_DEPS)$(C_UPPER_DEPS)$(SIZEDUMMY) miniEstacaoV6
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
