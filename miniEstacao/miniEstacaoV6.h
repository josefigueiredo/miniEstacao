// Only modify this file to include
// - function definitions (prototypes)
// - include files
// - extern variable definitions
// In the appropriate section

#ifndef _miniEstacaoV6_H_
#define _miniEstacaoV6_H_
#include "Arduino.h"
//add your includes for the project miniEstacaoV6 here
#include <Wire.h>
#include <DHT.h>
#include <SPI.h>
#include <Ethernet.h>
#include <aJSON.h>
#include <avr/pgmspace.h>


//end of add your includes here
#ifdef __cplusplus
extern "C" {
#endif
void loop();
void setup();
#ifdef __cplusplus
} // extern "C"
#endif

//add your function definitions for the project miniEstacaoV6 here
void sendJson();
void sendJsonHeader();
void sendHeader();
void sendResult();
void sendFooter();
void invLed();
long tempCont();
void mostra();
void atualizaLeitura();
float tempDHT();
float urDHT();
void bmp085Calibration();
short bmp085GetTemperature(unsigned int);
long bmp085GetPressure(unsigned long );
char bmp085Read(unsigned char );
int bmp085ReadInt(unsigned char );
unsigned int bmp085ReadUT();
unsigned long bmp085ReadUP();
int memoriaLivre();


//Do not add code below this line
#endif /* _miniEstacaoV6_H_ */
