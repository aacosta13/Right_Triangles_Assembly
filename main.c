//Using C and assembly to calculate a triangle's hypotenuse - Assignment 5
//Armando Acosta
//CPSC240-03

//Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

//Link: gcc -m64 -Wall -fno-pie -no-pie -o geofinal.out main.o geo.o

#include <stdio.h>

double geometry();

int main() {
	double ans = 0;

	//Introduction
	printf("Welcome to CPSC 240 brought to you by Armando Acosta.\n");
	printf("\n");

	//Call Assembly
	ans = geometry();

	//Print hypotenuse from Assembly
	printf("\nThe main program received this number %lf. Have a nice day.\n", ans);
	printf("Main will return 0 to the operating system.\n");

	return 0;	
}
