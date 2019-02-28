#!/bin/bash

    # Negro = 0;30    Gris oscuro = 1;30    Azul = 0;34    Azul claro = 1;34    Verde = 0;32    Verde claro = 1;32    Cyan = 0;36
    # Cyan claro = 1;36    Rojo = 0;31    Rojo claro = 1;31    Púrpura = 0;35    Púrpura claro = 1;35    Café = 0;33    Amarillo = 1;33
    # Gris = 0;37    Blanco = 1;37
#                                          ‘\e[CODIGOm(texto)\e[0m’ (el texto sin los paréntesis)


   # Negro = 40    Rojo = 41    Verde = 42    Amarillo = 43    Azul = 44    Rosa = 45    Cyan = 46    Blanco = 47
   # echo -e "\e[42mMuestra\e[49m"

fcyanama1="\e[1;33;46m"
fc="\e[49;0m"
printf "${fcyanama1}hola$fc"
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

