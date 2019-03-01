#!/bin/bash



GREEN="\033[0;32m"
NOCOLOR="\033[0m"

let valor=1
if [ "$valor" = 1 ]
then
	clear
	declare commandirri="hola"
	
	while [[ $commandirri != "exit" ]]
	do
		printf "${GREEN}$u @prebeshell: ${NOCOLOR}"
		IFS=" " read commandirri parametro1 parametro2
		if [ "$commandirri" != "hola" ]
		then
			if [ -f "$commandirri".sh ]
			then
				export parametro1
				export parametro2
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
