#!/bin/sh



echo "Necesito que respondas algunas cosas para saber cuando hacer el comando:  "
#Recibe los parametros para el comando
read -p "¿Que día de la semana?" diasemana
read -p "¿Que mes? (en numero)" mes
read -p "¿Que dia del mes? " dia
read -p "¿A que hora? " hora
read -p "¿En que minuto en especifico?" min
cls 									##Limpia pantalla
echo "Ahora, para finalizar... "
sleep 1
read -p "Ingresa el comando " comando  

crontab -l >  contrab.lst
echo "$min $hora $dia $mes $diasemana	root $comando" >> crontab.lst ##Redirecciona los parametros y el comando hacia el crontab

crontab crontab.lst
echo "Hecho "





