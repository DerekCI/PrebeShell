#!/bin/bash

##Gama de colores que podemos (o no) usar
rojo='\033[01;31m'
verde='\033[01;32m'
azul='\033[00;94m'
amarillo='\033[01;93m'
color_base='\033[01;37m'
#Pequeño banner de figleñ
figlet "Adivina quien!"
#Arreglo de becarios
becarios=("" "" "" "" "" "" "" )

echo -e "\t${amarillo}"
echo -e "\t\t\t\t Lista de becarios"
#Imprime los becarios
echo -e "\t ${becarios[0]:-Emanuel} | ${becarios[1]:-Hector} | ${becarios[2]:-Diego} | ${becarios[3]:-Any} | ${becarios[4]:-Rodrigo | ${becarios[5]:-Alicia} | ${becarios[6]:-Anallely}}"
#Da tiempo para que pienses en el becario
echo -e "\nTienes 5 segundos para elegir a tu becario Fav"
echo " 5..."
sleep 1
echo " 4..."
sleep 1
echo " 3..."
sleep 1
echo " 2..."
sleep 1
echo " 1..."
sleep 1
clear
figlet "GO"
sleep 1
#Esto es mas que nada como "hombre" "bajo")
hector=("hector" "lentes" "moreno" "negro" "hombre" "mediano")
diego=("diego" "sin_lentes" "hombre" "alto")
any=("any" "sin_lentes" "mujer" "mediano")
rodrigo=("rodrigo" "sin_lentes" "hombre" "mediano")
alicia=("alicia" "lentes" "mujer" "bajo")
anallely=("anallely" "sin_lentes" "mujer" "mediano")
clear #Limpia pagina
echo -e "\t${color_base}"

#Empieza el juego
echo "¿Tu becario usa lentes? [S/N]"
read respuesta
if [[ $respuesta == "S" ]] || [[ $respuesta == "s" ]]; then
	
	posibles=("${emanuel[0]}" "${hector[0]}" "${alicia[0]}")
	#Colorea de azul los becarios que hacen match con la pregunta, y de rojo a los que no
	echo -e "\t\t${azul} ${becarios[0]:-Emanuel} | ${becarios[1]:-Hector} | ${rojo} ${becarios[2]:-Diego} | ${becarios[3]:-Any} | ${becarios[4]:-Rodrigo | ${azul} ${becarios[5]:-Alicia} | ${rojo} ${becarios[6]:-Anallely}}"
	echo -e "${color_base}"
	printf "Becarios posibles: "
	echo -e "\t\t${azul}"
	for i in "${posibles[@]}"
	do
		printf " $i |"
	done

	echo -e "\n${color_base}¿Tu becario es hombre o mujer?[H/M]"
	read respuesta2
	if [[ $respuesta2 == "H" ]] || [[ $respuesta2 == "h" ]]; then
		
		posibles2=("${emanuel[0]}" "${hector[0]}")
		#Colorea de azul los becarios que hacen match con la pregunta, y de rojo a los que no
		echo -e "\t\t${azul} ${becarios[0]:-Emanuel} | ${becarios[1]:-Hector} ${rojo} | ${becarios[0]:-Alicia} "
		echo -e "${color_base}"
		printf "Becarios posibles: "
		echo -e "\t\t${azul}"
		for i in "${posibles2[@]}"
		do
			printf " $i |"
		done
		echo -e "\n¿Tu becario Favorito es Emanuel?"
		read final
		if [[ $final == "s" ]] || [[ $final == "S" ]]; then
		 	echo " Jajaja... siempre tengo razon!"
		else
			echo " ¿Enserio Hector? Chale, me ganaste :("
		fi 
	else
		#Colorea de azul los becarios que hacen no match con la pregunta, y de rojo a los que si
		echo -e "\t\t${rojo} ${becarios[0]:-Emanuel} | ${becarios[1]:-Hector} ${azul} | ${becarios[2]:-Alicia} "
		echo -e "${color_base}"
		echo "¿Tu becaria favorita es Alicia?"
		read final
		if [[ $final == "s" ]] || [[ $final == "S" ]]; then
		 	echo "Jajaja... siempre tengo razon!"
		 	echo "Bueno, la verdad esa estuvo muuuuuuuy facil."
		fi 
	fi


elif [[ $respuesta != "S" ]] || [[ $respuesta != "s" ]]; then
	posibles=("${diego[0]}" "${any[0]}" "${rodrigo[0]}" "${anallely[0]}")
	#Colorea de azul los becarios que hacen no match con la pregunta, y de rojo a los que si
	echo -e "\t\t${rojo} ${becarios[0]:-Emanuel} | ${becarios[1]:-Hector} | ${azul} ${becarios[2]:-Diego} | ${becarios[3]:-Any} | ${becarios[4]:-Rodrigo | ${rojo} ${becarios[5]:-Alicia} | ${azul} ${becarios[6]:-Anallely}}"
	echo -e "${color_base}"
	printf "Becarios posibles: "
	echo -e "\t\t${azul}"
	for i in "${posibles[@]}"
	do
		printf " $i |"
	done
	echo " "
	echo "¿Tu becario es Hombre o Mujer?"
	read respuesta2
	if [[ $respuesta2 == "H" ]] || [[ $respuesta2 == "h" ]]; then
		
		posibles2=("${diego[0]}" "${rodrigo[0]}")
		#Colorea de azul los becarios que hacen match con la pregunta, y de rojo a los que no
		echo -e "\t\t${azul} ${becarios[0]:-Diego} | ${rojo} ${becarios[1]:-Any}  | ${becarios[2]:-Anallely} | ${azul} ${becarios[3]:-Rodrigo} "
		echo -e "${azul}"
		printf "Becarios posibles: "
		echo -e "\t\t${color_base}"
		for i in "${posibles2[@]}"
		do
			printf " $i |"
		done
		echo -e "\n¿Tu becario Favorito es Diego?"
		read final
		if [[ $final == "s" ]] || [[ $final == "S" ]]; then
		 	echo " Jajaja... siempre tengo razon!"
		else
			echo " ¿Enserio Rodrigo? Chale, me ganaste :("
		fi 
	else
		#Colorea de azul los becarios que hacen no match con la pregunta, y de rojo a los que si
		posibles2=("${any[0]}" "${anallely[0]}")
		echo -e "\t\t${rojo} ${becarios[0]:-Diego} | ${azul} ${becarios[1]:-Any}  | ${becarios[2]:-Anallely} | ${rojo} ${becarios[3]:-Rodrigo} "
		echo -e "${color_base}"
		printf "Becarios posibles: "
		echo -e "\t\t${color_base}"
		for i in "${posibles2[@]}"
		do
			printf " $i |"
		done
		echo -e "\n¿Tu becaria favorita es Any?"
		read final
		if [[ $final == "s" ]] || [[ $final == "S" ]]; then
		 	echo "Jajaja... siempre tengo razon!"
		else
			echo " ¿Enserio Anallely? Chale, me ganaste :("
		fi
	fi
fi




