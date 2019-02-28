#!/bin/bash

### Cuadro mágico 3x3
### Prebe shell- equipo uno
###Un cuadrado mágico es un conjunto de números dispuestos en un cuadrado de forma tal que la suma de cada fila, columna y diagonal es el mismo número, también llamado “constante mágica"
###

figlet "                       Cuadro"
figlet "             mágico 3x3"
sleep 1.5
clear
let x=1   #Les recomiendo para calificar usar el valor de x=1 dónde el resultado del cuadro es: 4, 9, 2, (primera fila) 3, 5, 7, (segunda fila) 8, 1 y 6 (tercera fila)
#let x=$(( ( RANDOM % 100 )  + 1 ))
let y=$x+8
figlet "                 Bienvenido"
printf "\t Ingresa los números del $x al $y en el recuadro de tal manera de \n\t todas las sumas horizontales, verticales y diagonales den el \n\t mismo resultado\n\n\n"
sleep 2

declare -A matrix
#Se declara y crea la matriz
for ((i=1;i<=3;i++)) do
    for ((j=1;j<=3;j++)) do
        matrix[$i,$j]=0
    done
done
#Función que muestra la matriz en terminal
function Mostrar
{
	for ((j=1;j<=3;j++)) do
		printf "\t\t\t"
	    for ((i=1;i<=3;i++)) do
	        printf "\t"${matrix[$i,$j]}
	    done
	    echo
	    echo
	done
}

Mostrar #Se muestra la matriz por primera vez llena de 0s
sleep 2
clear

for ((m=1;m<=3;m++)) do #Para pedir al usuario un número en cada una de las posiciones, se hacen dos en para poder tener las posiciones como coordenadas del cuadro
    for ((n=1;n<=3;n++)) do
    	printf "\t \t Ingrese un número para la posición $m,$n : "
		read num
		printf "\n \n"
		matrix[$n,$m]=$num #Cambia el valor de la posición de la matriz según el ingresado por el usuario
		declare -i num"$n$m"=$num #Para no perder los valores ingresados por el usuario se crean variables según cambia m y n
		Mostrar #Se manda llamar la función Mostrar para que el usuario vea el cambio en la matriz
		sleep 2
    done
	echo
	clear
done

#################Por medio de num se debe asegurar que no se repitan los números

declare -i magic=($x*9)+36 #Valor que debe tener la suma de todos los número del cuadro mágico en función de x
declare -i linea=$magic/3 #Valor que deben tener las líneas del cuadro mágico, que al ser de 3x3 es el'total entre 3

declare -i h1="$num11"+"$num12"+"$num13" #h1 porque es la suma de todos los horizontales de la hilera1
declare -i h2="$num21"+"$num22"+"$num23" 
declare -i h3="$num31"+"$num32"+"$num33"
declare -i v1="$num11"+"$num21"+"$num31" #vertical 1
declare -i v2="$num12"+"$num22"+"$num32"
declare -i v3="$num13"+"$num23"+"num33"
declare -i d1="$num11"+"$num22"+"$num33" #diagonal 1
declare -i d2="$num13"+"$num22"+"num31"
declare -i lineas=$h1+$h2+$h3 #Representa la suma de todos los números dentro del cuadro del usuario
if (( $lineas==$magic && $linea==$h1 && $h1==$h2 && $h2==$h3 && $h3==$v1 && $v1==$v2 && $v3==$d1 && $d1==$d2)) #Revisa que cumpla todas las reglas del cuadro mágico
then
	printf "Ganaste \n"
else
	printf "Perdiste \n"
fi
