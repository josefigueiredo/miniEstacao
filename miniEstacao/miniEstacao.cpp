// Do not remove the include below
#include "miniEstacao.h"

/*
 Programa oficial
 Mini estaçao respondendo em JQMobile
 Somente sensores DHT11 e BMP085
 Implementar tambm JSON
 implementando armazenamento de strings em Flash
 */

// inicializa a shield ethernet
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress ip(10, 5, 99, 5);
//IPAddress ip(192,168,0,5);
EthernetServer server(80);
EthernetClient client;
const int MAX_PAGE_NAME_LEN = 8;
char buffer[MAX_PAGE_NAME_LEN + 1];


// Setup do DHT -------------------------------------------
#define DHTPIN 3
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// Setup do BMP085 -------------------------------------------
#define BMP085_ADDRESS 0x77  // I2C address of BMP085
const unsigned char OSS = 0;  // Oversampling Setting
// Calibration values
int ac1;
int ac2;
int ac3;
unsigned int ac4;
unsigned int ac5;
unsigned int ac6;
int b1;
int b2;
int mb;
int mc;
int md;

// b5 is calculated in bmp085GetTemperature(...), this variable is also used in bmp085GetPressure(...)
// so ...Temperature(...) must be called before ...Pressure(...).
long b5;
short tempBMP;
long pressBMP;

//globais do programa
long t1 = tempCont();
byte pinLed = 13;
float tempMedia;
float uDTH;
float tDTH;
boolean estado = HIGH;

// Inicio do programa -------------------------------------------
void setup() {
	Serial.begin(9600);
	Serial.println("Executando setup");
	//incializa o DHT
	dht.begin();
	Serial.println("Iniciou o dht");

	//inicializa o BMP
	Wire.begin();
	Serial.println("Iniciou o BMP");
	bmp085Calibration();
	Serial.println("Calibrando BMP....");
	//inicializa a interface ethernet
	Ethernet.begin(mac, ip);
	server.begin();
	Serial.print("servidor executando em ");
	Serial.println(Ethernet.localIP());
	//liga o led vermelho
	pinMode(pinLed, OUTPUT);
	digitalWrite(pinLed, estado);
	Serial.println("Ligado o led");

	//faz a primeira leitura
	atualizaLeitura();
	Serial.println("Primeira leitura");
	mostra();
	Serial.println("Primeira amostragem");
}

void loop() {
	if (tempCont() >= 0.5 + t1) {
		t1 = tempCont();
		Serial.println("Em execução... enviar 'm' para mostrar dados");
		invLed();
	}

	//amostragem por comando de leitura
	if (Serial.available()) {
		char c = Serial.read();
		switch (c) {
		case 'm':
			atualizaLeitura();
			mostra();
			break;
		case 'r':
			Serial.println(Ethernet.localIP());
			break;
		default:
			Serial.println("Comando nao identificado");
			break;
		}
	}
	delay(100);

	client = server.available();
	if (client) {
		while (client.connected()) {
			if (client.available()) {
				if (client.find("GET ")) {
					memset(buffer, 0, sizeof(buffer));
					if (client.find("/")) {
						if (client.readBytesUntil('/', buffer,
								MAX_PAGE_NAME_LEN)) {
							if (strcasecmp(buffer, "json") == 0) {
								sendJsonHeader();
								sendJson();
							} else {
								sendHeader();
								sendResult();
								sendFooter();

							}
						}
					}
					break;
				}
			}
			delay(2);
			client.stop();
		}
	}
}
/*
 #################################################################################
 ########################## Controle do servidor JSon 			   ###############
 #################################################################################
 */
void sendJson() {
	aJsonObject* tempoNoIF = aJson.createObject();
	aJsonObject* results = aJson.createObject();
	aJson.addItemToObject(tempoNoIF, "results", results);
	aJson.addNumberToObject(results, "tDTH", tDTH);
	aJson.addNumberToObject(results, "uDTH", uDTH);
	aJson.addNumberToObject(results, "tempBMP", tempBMP * 0.1);
	aJson.addNumberToObject(results, "pressBMP", (double) pressBMP);

	char* string = aJson.print(tempoNoIF);
	if (string != NULL) {
		client.println(string);
	}
	aJson.deleteItem(tempoNoIF);
}

void sendJsonHeader() {
	client.println(F("HTTP/1.1 200 OK"));
	client.print(F("Content-Type: "));
	client.println(F("application/json"));
	client.println();
}

/*
 #################################################################################
 ########################## Controle do servidor Web JQMobile      ###############
 #################################################################################
 */

void sendHeader() {
	//client.println(pgm_read_byte(&header));
	client.println(F("<html>"));
	client.println(F("<head>"));
	client.println(F("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"));
	client.println(F("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"));
	client.println(F("<title>Aplica&ccedil;&atilde;o Arduinizando - Temperatura</title>"));
	client.println(F("<link rel=\"stylesheet\" href=\"http://code.jquery.com/mobile/latest/jquery.mobile.min.css\" />"));
	client.println(F("<script src=\"http://code.jquery.com/jquery.min.js\"></script> "));
	client.println(F("<script src=\"http://code.jquery.com/mobile/latest/jquery.mobile.min.js\"></script>"));
	client.println(F("</head>"));
	client.println(F("<body>"));
	client.println(F("<div data-role=\"header\">"));
	client.println(F("<center>"));
	client.println(F("<p><h2>Micro Estacao de Monitoramento de Temperatura</h3></p>"));
	client.println(F("</div>"));
	client.println(F("</center>"));
}

void sendResult() {
	client.println(F("<div data-role=\"content\">"));
	client.println(F("<p>Temperatura agora no campus:  "));
	client.println(tempMedia);
	client.println(F("ºC </p>"));
	client.println(F("<p>Umidade Relativa agora no campus:  "));
	client.println(uDTH);
	client.println(F("% </p>"));
	client.println(F("<p>Pressao Atmosferica:  "));
	client.println(pressBMP);
	client.println(F("Pa </p>"));
	client.println(F("</div>"));

	}

void sendFooter() {
	//client.println(pgm_read_byte(&footer));
	client.println(F("<div data-role=\"resumo\">"));
	client.println(F("<font color=\"#808080\">"));
	client.println(F("<p>Dados do Projeto:</p>"));
	client.println(F("<em>Titulo:</em> Estudo das interfaces de comunicação e armazenamento da plataforma Arduino em uma aplicação prática.</br>"));
	client.println(F("<em>Objetivo:</em> Estudar e documentar as shields de comunicaçao do arduino, usando uma simples aplicacao de leitura de "));
	client.println(F("dados de temperatura, umidade relativa e pressao atmosferica. </br>"));
	client.println(F("<br>"));
	client.println(F("<center>Esta pagina e executada por um arduino ATMega 2560 com uma shield Ethernet 5100</center>"));
	client.println(F("<br>"));
	client.println(F("<b>Orientadores:</b> Prof. José Figueiredo, Prof. Anubis Rossetto"));
	client.println(F("<br>"));
	client.println(F("<b>Bolsistas:</b> Avner Dal Bosco, Suélen Camargo, Colaboracao: Cristiano Fontana"));
	client.println(F("<br>"));
	client.println(F("<b>Apoio e Fomento:</b> s"
			" <a href=\"http://www.ifsul.edu.br\">[PROPESP]</a></br>"));
	client.println(F("<br>"));
	client.println(F("Documentaço do projeto em:<a href=\"http://arduinizando.blogspot.com\"> arduinizando.blogspot.com </a></br>"));
	client.println(F("</font>"));
	client.println(F("</div>"));


	client.println(F("<div data-role=\"footer\" data-position=\"fixed\">"));
	client.println(F("<small><center>Instituto Federal Sul-rio-grandense, Campus Passo Fundo - 2013</center></small>"));
	client.println(F("</div>"));
	client.println(F("</div>"));
	client.println(F("</body>"));
	client.println(F("</html>"));
}
/*
 #################################################################################
 #################################################################################
 ########################## Controle de tempo e amostragem serial  ###############
 #################################################################################
 #################################################################################
 */
void invLed() {
	boolean last = estado;
	estado = !last;
	digitalWrite(pinLed, estado);
}

long tempCont() {
	// funcao baseada em http://forum.arduino.cc/index.php?topic=8774.0
	// retorna a contagem de tempo de minutos
	return millis() / 60000;
}

void mostra() {
	Serial.println(
			"########################## TEMPERATURA ###########################");
	Serial.print("Temperatura DHT011 = ");
	Serial.println(tDTH, DEC);
	Serial.println("----------------------");
	Serial.print("Temperatura BMP085: ");
	Serial.print(tempBMP * 0.1, DEC);
	Serial.println("  graus Celcius");

	Serial.println("----------------------");
	Serial.print("Temperatura Media: ");
	Serial.print(tempMedia, DEC);
	Serial.println("  graus Celcius");

	Serial.println("########################## UR ###########################");
	Serial.println("----------------------");
	Serial.print("Umidade Relativa DTH011 = ");
	Serial.println(uDTH, DEC);

	Serial.println(
			"########################## Pressao ###########################");
	Serial.println("----------------------");
	Serial.print("Pressao BMP085: ");
	Serial.print(pressBMP, DEC);
	Serial.println(" Pa");
	Serial.println();

}

/*
 #################################################################################
 #################################################################################
 ########################## Controle de sensores #################################
 #################################################################################
 #################################################################################
 */
void atualizaLeitura() {
	tempBMP = bmp085GetTemperature(bmp085ReadUT());
	pressBMP = bmp085GetPressure(bmp085ReadUP());

	tDTH = tempDHT();
	uDTH = urDHT();

	tempMedia = (tDTH + (tempBMP * 0.1)) / 2;
}

/*########################## funçes relativas ao DHT ########################## */
float tempDHT() {
	float temp = dht.readTemperature();

	// check if returns are valid, if they are NaN (not a number) then something went wrong!
	if (isnan(temp)) {
		Serial.println("Failed to read from DHT");
	} else {
		return temp;
	}
	return 0;
}

float urDHT() {
	float ur = dht.readHumidity();
	// check if returns are valid, if they are NaN (not a number) then something went wrong!
	if (isnan(ur)) {
		Serial.println("Failed to read from DHT");
	} else {
		return ur;
	}
	return 0;
}

/*########################## funçes relativas ao BMP 085 ########################## */
// Stores all of the bmp085's calibration values into global variables
// Calibration values are required to calculate temp and pressure
// This function should be called at the beginning of the program
void bmp085Calibration() {
	ac1 = bmp085ReadInt(0xAA);
	ac2 = bmp085ReadInt(0xAC);
	ac3 = bmp085ReadInt(0xAE);
	ac4 = bmp085ReadInt(0xB0);
	ac5 = bmp085ReadInt(0xB2);
	ac6 = bmp085ReadInt(0xB4);
	b1 = bmp085ReadInt(0xB6);
	b2 = bmp085ReadInt(0xB8);
	mb = bmp085ReadInt(0xBA);
	mc = bmp085ReadInt(0xBC);
	md = bmp085ReadInt(0xBE);
}

// Calculate temperature given ut.
// Value returned will be in units of 0.1 deg C
short bmp085GetTemperature(unsigned int ut) {
	long x1, x2;

	x1 = (((long) ut - (long) ac6) * (long) ac5) >> 15;
	x2 = ((long) mc << 11) / (x1 + md);
	b5 = x1 + x2;

	return ((b5 + 8) >> 4);
}

// Calculate pressure given up
// calibration values must be known
// b5 is also required so bmp085GetTemperature(...) must be called first.
// Value returned will be pressure in units of Pa.
long bmp085GetPressure(unsigned long up) {
	long x1, x2, x3, b3, b6, p;
	unsigned long b4, b7;

	b6 = b5 - 4000;
	// Calculate B3
	x1 = (b2 * (b6 * b6) >> 12) >> 11;
	x2 = (ac2 * b6) >> 11;
	x3 = x1 + x2;
	b3 = (((((long) ac1) * 4 + x3) << OSS) + 2) >> 2;

	// Calculate B4
	x1 = (ac3 * b6) >> 13;
	x2 = (b1 * ((b6 * b6) >> 12)) >> 16;
	x3 = ((x1 + x2) + 2) >> 2;
	b4 = (ac4 * (unsigned long) (x3 + 32768)) >> 15;

	b7 = ((unsigned long) (up - b3) * (50000 >> OSS));
	if (b7 < 0x80000000)
		p = (b7 << 1) / b4;
	else
		p = (b7 / b4) << 1;

	x1 = (p >> 8) * (p >> 8);
	x1 = (x1 * 3038) >> 16;
	x2 = (-7357 * p) >> 16;
	p += (x1 + x2 + 3791) >> 4;

	return p;
}

// Read 1 byte from the BMP085 at 'address'
char bmp085Read(unsigned char address) {
	unsigned char data;

	Wire.beginTransmission(BMP085_ADDRESS);
	Wire.write(address);
	Wire.endTransmission();

	Wire.requestFrom(BMP085_ADDRESS, 1);
	while (!Wire.available())
		;

	return Wire.read();
}

// Read 2 bytes from the BMP085
// First byte will be from 'address'
// Second byte will be from 'address'+1
int bmp085ReadInt(unsigned char address) {
	unsigned char msb, lsb;

	Wire.beginTransmission(BMP085_ADDRESS);
	Wire.write(address);
	Wire.endTransmission();

	Wire.requestFrom(BMP085_ADDRESS, 2);
	while (Wire.available() < 2)
		;
	msb = Wire.read();
	lsb = Wire.read();

	return (int) msb << 8 | lsb;
}

// Read the uncompensated temperature value
unsigned int bmp085ReadUT() {
	unsigned int ut;

	// Write 0x2E into Register 0xF4
	// This requests a temperature reading
	Wire.beginTransmission(BMP085_ADDRESS);
	Wire.write(0xF4);
	Wire.write(0x2E);
	Wire.endTransmission();

	// Wait at least 4.5ms
	delay(5);

	// Read two bytes from registers 0xF6 and 0xF7
	ut = bmp085ReadInt(0xF6);
	return ut;
}

// Read the uncompensated pressure value
unsigned long bmp085ReadUP() {
	unsigned char msb, lsb, xlsb;
	unsigned long up = 0;

	// Write 0x34+(OSS<<6) into register 0xF4
	// Request a pressure reading w/ oversampling setting
	Wire.beginTransmission(BMP085_ADDRESS);
	Wire.write(0xF4);
	Wire.write(0x34 + (OSS << 6));
	Wire.endTransmission();

	// Wait for conversion, delay time dependent on OSS
	delay(2 + (3 << OSS));

	// Read register 0xF6 (MSB), 0xF7 (LSB), and 0xF8 (XLSB)
	Wire.beginTransmission(BMP085_ADDRESS);
	Wire.write(0xF6);
	Wire.endTransmission();
	Wire.requestFrom(BMP085_ADDRESS, 3);

	// Wait for data to become available
	while (Wire.available() < 3)
		;
	msb = Wire.read();
	lsb = Wire.read();
	xlsb = Wire.read();

	up = (((unsigned long) msb << 16) | ((unsigned long) lsb << 8)
			| (unsigned long) xlsb) >> (8 - OSS);

	return up;
}

extern int __bss_end;
extern void *__brkval;

int memoriaLivre() {
	int memLivre;
	if ((int) __brkval == 0)
		memLivre = ((int) &memLivre) - ((int) &__bss_end);
	else
		memLivre = ((int) &memLivre) - ((int) &__brkval);
	return memLivre;
}

