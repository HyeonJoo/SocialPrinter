#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <wiringPi.h>
#include <wiringSerial.h>
#include <unistd.h>

/*
	File Name: PrintSignal.c
	Author: Lee Ahreum & Park Mijeong

	It reads the message from shared file..
	When read the message (except for '1'), Send the print signal to Social Printer (Arduino..)
*/
int main(int argc, char* argv[])
{
	printf("Main Start\n");
    	
	int fd,i;
	FILE *fp, *fp_r;
	char* inp;
	int buf_size = 1024;

	if(argc!=2)
	{
		printf("Unable to start Pi\n");
		exit(1);
	}

	// Open the serial port..
   	if((fd = serialOpen("/dev/ttyACM0",115200)) <0)
    	{
		fprintf(stderr,"Unalbe to open serial device : %s\n",strerror(errno));
		return 1;
    	}

    	if(wiringPiSetup() == -1)
    	{
    		fprintf(stdout, "Unable to start wiringPi : %s\n", strerror(errno));
		return 1;
    	}

	while(1){
		
		fp = fopen("msg.txt", "r");
		inp = malloc(buf_size+5);

		if(fgets(inp, buf_size, fp))
		{
			// There is no message ..
			if(strlen(inp)==1){
				printf("No Message!\n");
			}else{ // There is the message from Social Printer Web ..
				printf("Msg: %s \n", inp);
				// Send the message to Social Printer (Arduino..)
				serialPuts(fd,inp);
				fp_r = fopen("msg.txt", "w");
				fprintf(fp_r, "1");
				fclose(fp_r);
			}

		}
		fclose(fp);
		sleep(2);
	}

    return 0;
}
