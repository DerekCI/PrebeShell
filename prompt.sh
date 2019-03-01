#!/bin/bash
trap 'exit' 2 20 #
trap 'exit' SIGTSTP

GREEN="\033[0;32m"
NOCOLOR="\033[0m"

let valor=1

if [ "$valor"=1 ]
then
	clear
	declare commandirri="hola"
	
	while [[ $commandirri != "exit" ]]
	do
		printf "${GREEN}$u @prebeshell: ${NOCOLOR}"
		#read commandirri
		IFS="" read -r commandirri </dev/tty
		if ! type foobar > /dev/null; then
			"$commandirri"
		elif [ "$commandirri" != "hola" ] #|| ! type foobar &> /dev/null ]
		then
			if [ -f "${commandirri}.sh" ]
			then
				./"$commandirri".sh
			else
				#if [ ]
				#then
				#fi
				echo "Ese comando no existe :c"
				if [ "$commandirri" = "exit" ]
				then
					echo "Bueno, vai"
				fi
			fi
		fi
	done
else
		echo "Usted no ha ingresado como usuario, ciao"
fi

