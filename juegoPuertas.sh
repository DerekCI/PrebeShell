#!/bin/bash

fcyanama="\e[1;33;46m"
fc="\e[49;0m"
negro="\e[0;30m"
azul="\e[0;34m"
f="\e[0m"
frojo="\e[41m"          ##codigos para poner colores
famarillo="\e[43m"
ff="\e[49m"

colorear(){
	echo -e $fcyanama$1$fc
}

let intentos=3 #Intentos para adivinar
let solucion=$RANDOM%6	#aleatorio del 1 al 6
clear
figlet "		PUERTONAS"
echo -e "${frojo}	Tienes que encontrar la salida, solo hay una puerta que sale de la habitación donde estas"
	colorear "================================================================================"
echo -e "\n${frojo} 		Solo tienes $intentos vidas"
	colorear "================================================================================"
printf "\n\n"
echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
echo " ___   ___   ___   ___   ___   ___ "
echo "|  .| |  .| |  .| |  .| |  .| |  .|"
echo "|   | |   | |   | |   | |   | |   |"
echo " ---   ---   ---   ---   ---   --- "
printf "\n\n\n"

function abreBuena
{
	let numero--
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	echo "|  .| |  .| |  .| |  .| |  .| |  .|"
	echo "|   | |   | |   | |   | |   | |   |"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2

	printf "\n\n"
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	for i in $(seq 1 $numero);do
		printf "|  .| "
	done
	printf "|.| | "
	for i in $(seq $numero 4);do
		printf "|  .| "
	done
	printf "\n"
	for i in $(seq 1 $numero);do
		printf "|   | "
	done
	printf "| | | "
	for i in $(seq $numero 4);do
		printf "|   | "
	done
	printf "\n"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2

	printf "\n\n"
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	for i in $(seq 1 $numero);do
		printf "|  .| "
	done
	printf "|n n| "
	for i in $(seq $numero 4);do
		printf "|  .| "
	done
	printf "\n"
	for i in $(seq 1 $numero);do
		printf "|   | "
	done
	printf "| u | "
	for i in $(seq $numero 4);do
		printf "|   | "
	done
	printf "\n"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2
	printf "\n"
	echo "¡Bien Jugado!"
}

function abreMala
{
	let numero--
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	echo "|  .| |  .| |  .| |  .| |  .| |  .|"
	echo "|   | |   | |   | |   | |   | |   |"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2
	printf "\n\n"
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	for i in $(seq 1 $numero);do
		printf "|  .| "
	done
	printf "|.| | "
	for i in $(seq $numero 4);do
		printf "|  .| "
	done
	printf "\n"
	for i in $(seq 1 $numero);do
		printf "|   | "
	done
	printf "| | | "
	for i in $(seq $numero 4);do
		printf "|   | "
	done
	printf "\n"
	echo " ---   ---   ---   ---   ---   --- "

	sleep 2
	printf "\n\n"
	echo -e "${famarillo}  1     2     3     4     5     6    ${ff}"
	echo " ___   ___   ___   ___   ___   ___ "
	for i in $(seq 1 $numero);do
		printf "|  .| "
	done
	printf "|X X| "
	for i in $(seq $numero 4);do
		printf "|  .| "
	done
	printf "\n"
	for i in $(seq 1 $numero);do
		printf "|   | "
	done
	printf "| n | "
	for i in $(seq $numero 4);do
		printf "|   | "
	done
	printf "\n"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2
	printf "\n"
	

}

while ((intentos!=0))
do
	read -p "Ingrese el número de la puerta que desee abrir: " numero ##read lee algo del prompt, con -p te permite poner mensaje
	if ((numero==solucion));then #si encuentra la solucion se abreBuena
		clear
		abreBuena
		exit
	else
		clear #si no encuentra la solucion se abreMala
		abreMala

	fi
	((intentos--))
	if ((intentos==0));then
		echo -e "${frojo}----------PERDISTE----------" #si ya no hay intentos pierde
		exit
	fi
	echo -e "${frojo}¡Apestas, intenta de nuevo!${ff}"
	printf "\n\n"
	echo -e "${frojo}Ahora solo tienes $intentos vidas${ff}"
	sleep 1
done

#sleep 1
#echo "  1     2     3     4     5     6  "
#echo " ___   ___   ___   ___   ___   ___ "
#echo "|.| | |.| | |.| | |.| | |.| | |.| |"
#echo "| | | | | | | | | | | | | | | | | |"
#echo " ---   ---   ---   ---   ---   --- "
#sleep 1
#echo "  1     2     3     4     5     6  "
#echo " ___   ___   ___   ___   ___   ___ "
#echo "|   | |   | |   | |   | |   | |   |"
#echo "|   | |   | |   | |   | |   | |   |"
#echo " ---   ---   ---   ---   ---   --- "

#echo "  1     2     3     4     5     6  "
#echo " ___   ___   ___   ___   ___   ___ "
#echo "|   | |   | |n n| |   | |x x| |   |"
#echo "|   | |   | | u | |   | | n | |   |"
#echo " ---   ---   ---   ---   ---   --- "
