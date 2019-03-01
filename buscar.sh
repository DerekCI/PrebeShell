#!/bin/bash



fcyanama1="\e[1;33;46m"
fc="\e[49;0m"
negro="\e[0;30m"
azul="\e[0;34m"
f="\e[0m"
frojo="\e[41m"          ##codigos para poner colores
famarillo="\e[43m"
ff="\e[49m"

buscar()
{

	if [ -d $2 ];			#Revisa si existe la carpeta que indican
	then
		cd $2				#Ingresa a la carpeta para poder ver si existe el archivo
		if [ -f $1 ];		#Revisa si existe el archivo que indican
		then
		cd ..				#Regresa a la carpeta anterior 
		find $2 -iname $1	# busca los archivos sin importar las mayusculas o minusculas
		else
		echo -e "${frojo}======${famarillo}Lo siento, no existe ese archivo${frojo}======${ff}" #si no existe el archivo
		fi
	else
	echo -e "${frojo}======${famarillo}Lo siento, no existe esa carpeta${frojo}======${ff}" #Si no existe la carpeta
	fi

}


buscar $1 $2


