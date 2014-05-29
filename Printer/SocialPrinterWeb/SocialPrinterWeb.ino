
/*
  File Name: SocialPrinterWeb.ino
  Author: Lee AhReum & Park Mijeong
  
  When received the print signal, It prints the message
*/

// Use external libraries for Serial & Thermal Printer
#include "SoftwareSerial.h"
#include "Adafruit_Thermal.h"
#include <string.h>
#include <avr/pgmspace.h>

int printer_RX_Pin = 5;  
int printer_TX_Pin = 6;  

Adafruit_Thermal printer(printer_RX_Pin, printer_TX_Pin);

void setup(){
  Serial.begin(115200);
  pinMode(7, OUTPUT); digitalWrite(7, LOW); // To also work w/IoTP printer
  printer.begin();
  printer.println("Printer ON");
  printer.println("");
  Serial.write("Printer UART On\n");
}

void loop() {
  String data;
  char ch;

  // When received the print signal
  if(Serial.available())
  {
    // Print the message from Social Printer Web Site
    data= (String)Serial.readString();
    printer.println(data);
}

  delay(1000);
}

