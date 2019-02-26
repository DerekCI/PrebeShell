#! /bin/bash
printf "Directorio actual: "
pwd #Solo imprime la ruta en el que se va a usar tree
for dir in *     #Busca directorios/archivos en la ruta actual
do
  echo "---> $file"           #Cada que encuentra un archivo, lo muestraa
  if [ -d "$dir" ] ; then     #Si el archivo es un directorio entra al bucle
    #echo "+---> "
    cd $dir                   #Entra al directorio
    for dir in *              #Busca archivos en el directorio al que entro
    do
      echo " +---> $dir"      #Cada que encuentra un archivo(x2)en el directorio, lo muestra   
    done 
    cd ..                     #Se sale del directorio
  fi
  
done 

