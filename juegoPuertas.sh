#!/bin/bash
let intentos=3
let solucion=$RANDOM%6
clear
echo "Tienes que encontrar la salida, solo hay una puerta que sale de la habitación donde estas"
echo "Solo tienes $intentos vidas"
printf "\n\n"
echo "  1     2     3     4     5     6  "
echo " ___   ___   ___   ___   ___   ___ "
echo "|  .| |  .| |  .| |  .| |  .| |  .|"
echo "|   | |   | |   | |   | |   | |   |"
echo " ---   ---   ---   ---   ---   --- "
printf "\n\n\n"

function abreBuena
{
	let numero--
	echo "  1     2     3     4     5     6  "
	echo " ___   ___   ___   ___   ___   ___ "
	echo "|  .| |  .| |  .| |  .| |  .| |  .|"
	echo "|   | |   | |   | |   | |   | |   |"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2

	printf "\n\n"
	echo "  1     2     3     4     5     6  "
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
	echo "  1     2     3     4     5     6  "
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
	echo "  1     2     3     4     5     6  "
	echo " ___   ___   ___   ___   ___   ___ "
	echo "|  .| |  .| |  .| |  .| |  .| |  .|"
	echo "|   | |   | |   | |   | |   | |   |"
	echo " ---   ---   ---   ---   ---   --- "
	sleep 2
	printf "\n\n"
	echo "  1     2     3     4     5     6  "
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
	echo "  1     2     3     4     5     6  "
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
	#echo "$solucion"
	read -p "Ingrese el número de la puerta que desee abrir: " numero ##read lee algo del prompt, con -p te permite poner mensaje
	if ((numero==solucion));then
		clear
		abreBuena
		exit
	else
		clear
		abreMala

	fi
	((intentos--))
	if ((intentos==0));then
		echo "----------PERDISTE----------"
		exit
	fi
	echo "¡Apestas, intenta de nuevo!"
	printf "\n"
	echo "Ahora solo tienes $intentos vidas"
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