#!/bin/bash

negro="\e[0;30m"
azul="\e[0;34m"
f="\e[0m"
frojo="\e[41m"          ##codigos para poner colores
famarillo="\e[43m"
fcyan="\e[46m"
fcyanama1="\e[1;33;46m"
fcyanama="\e[1;33;40m"
fcyanama2="\e[1;34;40m"
ff="\e[49m"
fc="\e[49;0m"

colorear(){
	echo -e $fcyanama$1$fc
}



titulo(){
	colorear "================================================================================"
	figlet  "		PREBEPLAYER"
	colorear "================================================================================"
	printf "\n\n"
}

showMenu(){
	colorear "=================================================================="
	printf "${fcyanama}||$fc                     ${fcyanama2}OPCIONES$fc                                 ${fcyanama}||\n"
	colorear "=================================================================="
	echo -e "${fcyanama}||${fcyanama2} (d) <---Canción anterior      ${fcyanama}||${fcyanama2} Canción Siguiente----> (f)  ${fcyanama}||"
	echo -e "${fcyanama}||${fcyanama2} (,) <---Regresar              ${fcyanama}||${fcyanama2}        Adelantar----> (.)   ${fcyanama}||"
	echo -e "${fcyanama}||${fcyanama2} (espacio) <---Repr/Pausar     ${fcyanama}||${fcyanama2}         Reiniciar----> (b)  ${fcyanama}||"
	colorear "||===============================||=============================||"
	echo -e "${fcyanama}||${fcyanama2}                               ${fcyanama}||${fcyanama2}      -      |      +        ${fcyanama}||"
	echo -e "${fcyanama}||${fcyanama2}    (q) <---Menu inicial       ${fcyanama}||${fcyanama2}   Baja      |   Sube        ${fcyanama}||"
	echo -e "${fcyanama}||${fcyanama2}    album = $album             ${fcyanama}||${fcyanama2}   Volumen   |   Volumen     ${fcyanama}||$fc"
	colorear "=================================================================="
	echo -e "${fcyanama2}    cancion = $actual"          
	colorear "==================================================================" ##MENU cuando se reproduce cancion
}

iniciaRep(){
	while [[ $salido -eq 0 ]]; do  ##Salido es para saber cuando el usuario quiere salir
		clear
	cd "Musica" #Debe de iniciarse el programa donde esta la carpeta musica
	titulo
	colorear "=================================================================="
	echo -e "${fcyanama}||$fc   ${fcyanama2}Escoge las opciones:     $fc                                  ${fcyanama}||" #Este es el menu principal
	colorear "=================================================================="
	echo -e "${fcyanama}||$fc   ${fcyanama2}1) Ver albums disponibles$fc                                  ${fcyanama}||"
	echo -e "${fcyanama}||$fc   ${fcyanama2}2) Reproducir aleatorio  $fc                                  ${fcyanama}||"
	echo -e "${fcyanama}||$fc   ${fcyanama2}3) Salir del reproductor $fc                                  ${fcyanama}||"
	colorear "=================================================================="
	read opcion
	clear
	titulo
	case $opcion in #Opciones del menu principal
		1)
			colorear "=================================================================="
			printf "${fcyanama2}                     Estos son los albums:                        ${fcyanama2}\n"
			colorear "=================================================================="
			printf "${fcyanama2}\n\n"
			ls -F | grep "/$" #muestra los archivos
			printf "\n"
			colorear "=================================================================="
			printf "${fcyanama2}                     Escribe el nombre del album:                 ${fc}\n"
			read album
			cd $album
			clear
			titulo
			colorear "=================================================================="
			printf "${fcyanama2}                     Canciones en el album $album:\n\n            \n"
			#printf "Canciones en el album $album:\n\n"
			colorear "=================================================================="
			printf "${fcyanama2}"
			ls | grep "mp3$" 
			
			printf "\n\n$fc"
			colorear "=================================================================="
			printf "${fcyanama2}                     Escribe R o r para reproducir album          \n"
			read tecla
			case $tecla in
				R|r )
					clear
					titulo
					showMenu
					echo "$PWD"
					
					for f in $PWD/*; do
    					echo "$f" > cancionahorita
    					clear
						titulo
						actual=$(grep ".mp3" cancionahorita)
						showMenu
	    				mpg123 -q "$f" ##Reproduce el .mp3 actual 
					done

					clear
					cd ..
					cd ..
					;;
			esac
			;;
		2) ##Para reproducir una cancion aleatoria de un album aleatorio
			num=0
			ls -F | grep "/$">lista.txt
			for i in $PWD/* ##checa todo lo que tiene dentro del directorio
			do
				if [ -d "$i" ];then					
					let num=num+1
				fi
			done

			let ran=$RANDOM%num
			let ran=ran+1
			album=$(sed -n ${ran}p lista.txt)
			cd $album
			clear
			titulo
			printf "Canciones en el album $album\n\n"
			ls | grep "mp3$"
			printf "\n\n"
			clear
			titulo
			showMenu
			mpg123 -q *.mp3 
			clear	
			cd ..
			cd ..
			;;
		3)
			figlet "Estas SEGURO?       S / N" #Para salir
			read dec
			case $dec in
				S|s )
					salido=1
					;;
				N|n )
					iniciaRep
					;;
				*)
					echo "Escribe bien :P"
					;;
			esac
			;;
		*)
			echo "Escribe bien :P"
			;;
	esac
		done
}

#Verificar si el programa existe
dpkg --get-selections>instalaciones  ##escribe los paquetes que tenemos
if [ $(egrep -c "mpg123" instalaciones) -eq 0 ] ##Si no se encuentra
then
	echo "Desea instalar?"
	read dec
			case $dec in
				S|s )
					sudo apt-get install mpg123
					iniciaRep
					;;
				N|n )
					echo "Wueno, no quieres escuchar a mi bebecita brrrr!"
					sleep 1
					;;
				*)
					echo "Escribe bien :P"
					;;
			esac

else
	#echo "$(egrep -c "mpg123" instalaciones)"
	sleep 1
	iniciaRep
fi


