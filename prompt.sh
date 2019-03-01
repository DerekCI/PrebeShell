#!/bin/bash
trap '' 2 20 #Se encierra" los codigos de salida de Ctrl+Z (2) y Ctrl +C (20)
trap '' SIGTSTP
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

#let valor=1 #Descomentar el valor si se quiere ingresar sin que sea de login

if [ "$valor"=1 ]
then
	clear
	declare commandirri="ZZZ"
	
	while [[ $commandirri != "salir" ]]
	do
		printf "${GREEN}$u @prebeshell: ${NOCOLOR}"
		#read commandirri
		IFS="" read -r commandirri > /dev/tty
		if ! type " " &> /dev/null; then
			"$commandirri"
		elif [ "$commandirri" != "ZZZ" ] #|| ! type foobar &> /dev/null ]
		then
			if [ -f "${commandirri}.sh" ]
			then
				./"$commandirri".sh
			else
				echo "Ese comando no existe :c"
				if [ "$commandirri" = "salir" ]
				then
					echo "Bueno, vai"
				fi
			fi
		fi
	done
else
		echo "Usted no ha ingresado como usuario, ciao"
fi

