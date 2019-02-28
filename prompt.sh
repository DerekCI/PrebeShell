#!/bin/bash

GREEN="\033[0;32m"
NOCOLOR="\033[0m"

if [ "$valor" = 1 ]
then
	clear
	declare commandirri="hola"
	
	while [[ $commandirri != "exit" ]]
	do
		printf "${GREEN}$u @prebeshell: ${NOCOLOR}"
		read commandirri
		if [ "$commandirri" != "hola" ]
		then
			if [ -f "$commandirri".sh ]
			then
				./"$commandirri".sh
			else
				echo "Ese comando no existe :c"
			fi
			if [ "$commandirri" = "exit" ]
			then
				echo "Bueno, vai"
			fi
		fi
	done
else
		echo "Usted no ha ingresado como usuario, ciao"
fi
