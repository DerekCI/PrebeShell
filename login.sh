#!/bin/bash

printf "Ingresa tu nombre de usuario: "
read u

if ! grep ^$u /etc/passwd > /dev/null; then
   echo -e "No eres un usuario en esta compu, vai\n\n"
elif test -z "$2"; then
	printf "Ingresa tu contraseña:"
	read -s c

	dormir=$IFS # Salva el valor de IFS 
	IFS=$ # /etc/passwd usa ":"para separar los campos 
	sudo chmod 755 /etc/shadow
	cat /etc/shadow | 
		while read name tipocifrado salt passwd #Va leyendo línea por línea y guarda lo que encuentra separado por el IFS modificado $
		do 
			if [ "$name" = "$u:" ] #Como salve el user por $ se almaceno en name con un : así que lo añado
			then
				IFS=: # /etc/passwd usa ":"para separar los campos
		sudo chmod 755 /etc/shadow

		cat /etc/shadow | 
			while read name passwd cosa1 cosa2 #Va leyendo línea por línea y guarda lo que encuentra separado por el IFS modificado :
			do 
				if [ "$name" = "$u" ] #Aquí ya salve name igual que el usuario
				then
				sudo apt install whois #Se debe tener instalado whois para ejecutar el mkpasswd

					cifrada=$(mkpasswd -m sha-512 $c $salt) #cifra la contraseña ingresada con sha 512 (Secure Hash Algoritm), el use y la sal que recupere en el while anterior GGG
					if [ "$cifrada" == "$passwd" ]
					then
						clear
						echo "Login correcto. Bienvenido $u "
						sleep 2
						let valor=1
						export valor
						export u
						./prompt.sh
					else
						echo "Tu contraseña es incorrecta, ciao"
					fi
				fi
			done 
	IFS=$dormir # Recupera el $IFS original
			fi
		done 
fi
