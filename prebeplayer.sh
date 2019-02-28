#!/bin/bash
#PREBEPLAYERLa interfaz gráfica de este reproductor
#es de diseño libre, aunque debe incluir al menos una manera para 
#navegar sobre la biblioteca musical, un área que muestre el status actual de 
#la reproducción y una sección que indique al usuario cómo utilizar el programa.

#Para hacer el prebeplayer, ustedes requerirán del programa mpg123, 
#y harán la programación de esta parte basados en comandos para mpg123.
# Sin embargo, al principio de la ejecución de la terminal, esta debe revisar
# si el programa está instalado y realizar la instalación si es que el usuario no lo tiene.
#Si está instalado, simplemente no se muestra nada al inicio de la ejecución de la terminal. Extra
#abrecanciones(){
	#find . -type f -name "*.mp3" | xargs grep "*.mp3"
#}

    # Negro = 0;30    Gris oscuro = 1;30    Azul = 0;34    Azul claro = 1;34    Verde = 0;32    Verde claro = 1;32    Cyan = 0;36
    # Cyan claro = 1;36    Rojo = 0;31    Rojo claro = 1;31    Púrpura = 0;35    Púrpura claro = 1;35    Café = 0;33    Amarillo = 1;33
    # Gris = 0;37    Blanco = 1;37
#                                          ‘\e[CODIGOm(texto)\e[0m’ (el texto sin los paréntesis)


   # Negro = 40    Rojo = 41    Verde = 42    Amarillo = 43    Azul = 44    Rosa = 45    Cyan = 46    Blanco = 47
   # echo -e "\e[42mMuestra\e[49m"


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
	echo -e "${fcyanama}||${fcyanama2}    cancion = $actual          ${fcyanama}||${fcyanama2}             |               ${fcyanama}||"
	echo -e "${fcyanama}||${fcyanama2}                               ${fcyanama}||${fcyanama2}             |               ${fcyanama}||"
	colorear "=================================================================="
}

iniciaRep(){
	while [[ $salido -eq 0 ]]; do
		clear
	cd "Musica" #Debe de iniciarse el programa donde esta la carpeta musica
	titulo
	colorear "=================================================================="
	echo -e "${fcyanama}||$fc   ${fcyanama2}Escoge las opciones:     $fc                                  ${fcyanama}||"
	colorear "=================================================================="
	echo -e "${fcyanama}||$fc   ${fcyanama2}1) Ver albums disponibles$fc                                  ${fcyanama}||"
	echo -e "${fcyanama}||$fc   ${fcyanama2}2) Reproducir aleatorio  $fc                                  ${fcyanama}||"
	echo -e "${fcyanama}||$fc   ${fcyanama2}3) Salir del reproductor $fc                                  ${fcyanama}||"
	#echo "||1) Ver albums disponibles"
	#echo "||2) Reproducir aleatorio"
	#echo "||3) Salir del reproductor"
	colorear "=================================================================="
	#figlet "============="
	read opcion
	clear
	titulo
	case $opcion in
		1)
			colorear "=================================================================="
			printf "${fcyanama2}                     Estos son los albums:                        ${fcyanama2}\n"
			#printf "Estos son los albums:\n"
			colorear "=================================================================="
			printf "${fcyanama2}\n\n"
			ls -F | grep "/$" 
			printf "\n"
			colorear "=================================================================="
			printf "${fcyanama2}                     Escribe el nombre del album:                 ${fc}\n"
			read album
			cd $album
			#find . -type f -name "*.mp3" | xargs grep "*.mp3"
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
			#echo "Escribe R o r para reproducir album"
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
						#actual= cat cancionahorita ## | grep "*\.mp3"
						grep "mp3" cancionahorita
						actual=$(grep -e "\/([a-Z])*\.mp3" cancionahorita)
						echo "dad"
						echo $actual
						showMenu
						#grep "*\.mp3" cancionahorita
						#actual= grep "*\.mp3" cancionahorita
						#echo "$actual"
	    				mpg123 -q "$f" # maybe redirect stdout / stderr?
					done
					#mpg123 -q  --continue *.mp3 

					clear
					cd ..
					cd ..
					;;
			esac
			;;
		2)
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
			#printf $ran
			album=$(sed -n ${ran}p lista.txt)
			cd $album
			#find . -type f -name "*.mp3" | xargs grep "*.mp3"
			clear
			titulo
			printf "Canciones en el album $album\n\n"
			ls | grep "mp3$"
			printf "\n\n"
			#echo "Presiona R o r para reproducir album"
			#read tecla
			#case $tecla in
			#	R|r )
					clear
					titulo
					showMenu
					mpg123 -q *.mp3 
					clear	
					cd ..
					cd ..
			#		;;
			#	*)
			#		echo "Escribe bien :P"
			#		;;
			#esac
			;;
		3)
			figlet "Estas SEGURO?       S / N"
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
sudo apt-get install mpg123

#programa

iniciaRep

#let num=1
#echo >"listaAlbum.txt"
#for i in $PWD/* ##checa todo lo que tiene dentro del directorio
#	do
#			if [ -d "$i" ];then 
#				echo "$num \"$i\"">>"listaAlbum.txt"
#				
#				let num=num+1
#			fi
#	done
#lista=$(cat listaAlbum.txt)
#echo $lista


#grep '[A-z]+"' listaAlbum.txt>
#sed -e 's/(\/.*[A-z]+\/Musica\/)//g' "listaAlbum.txt">"listaAlbum.txt"
#dialog --title "PREBEPLAYER" --msgbox 'Hola Sololinux!' 6 20
#dialog --begin 10 20 --backtitle "PREBEPLAYER" --title "About" --msgbox 'Pese a que muchos les fastidie, el conocimiento debe ser libre y gratuito.' 10 30