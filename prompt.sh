#!/bin/bash
trap '' 2 20 #Se encierra" los codigos de salida de Ctrl+Z (2) y Ctrl +C (20)
trap "" SIGINT SIGTSTP
 #Se encierra" los codigos de salida de Ctrl+Z (2) y Ctrl +C (20)
trap "echo -n -e '   no'" INT


 	 
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

let valor=1
if [ "$valor" = 1 ]
then
	clear
	declare commandirri="hola"
	
	while [[ $commandirri != "salir" ]]
	do
		printf "${GREEN}$u @prebeshell: ${NOCOLOR}"
		read commandirri parametro1 parametro2
		echo $parametro1
		echo $parametro2
		if [ -f "$commandirri".sh ]
			then
				if [ "$parametro1" != "" ]
					then
						if [ "$parametro2" != "" ]
						then
							hacer="./$commandirri.sh $parametro1 $parametro2"
							$hacer
						else
							hacer="./$commandirri.sh $parametro1"
							$hacer
						fi
						
				else
					./"$commandirri.sh"
				fi
				
			else
				if ! type foobar &> /dev/null; then
					$commandirri
				elif [ "$commandirri" != "hola" ]
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
		fi
		#if ! type foobar &> /dev/null; then
		#	$commandirri
		#elif [ "$commandirri" != "hola" ]
		#	then
		#	if [ -f "$commandirri".sh ]
		#	then
		#		./"$commandirri".sh
		#	else
		#		echo "Ese comando no existe :c"
		#	fi
		#	if [ "$commandirri" = "exit" ]
		#	then
		#		echo "Bueno, vai"
		#	fi
		#fi
		#if [ "$commandirri" != "hola" ]
		#then
		#	if [ -f "$commandirri".sh ]
		#	then
		#		./"$commandirri".sh
		#	else
		#		echo "Ese comando no existe :c"
		#	fi
		#	if [ "$commandirri" = "exit" ]
		#	then
		#		echo "Bueno, vai"
		#	fi
		#fi
	done
else
		echo "Usted no ha ingresado como usuario, ciao"
fi
