#! /bin/bash



ayuda()
{
	#echo 'Esto da la descripcion de cada comando'

	#echo '¿De que comando quieres ayuda?'
	#echo '1)Login. 2)Fecha. 3)Hora. 4)Buscar. 5)Prompt. 6)PrebePlayer. 7)Tree. 8)Adivina Quien. 9)Cuadro Magico. 10)juegoPuertas. 11)Interfaz Crontab. 12)Ayuda. 13)Creditos.'
	
	case $1 in
		login)
			echo 'El comando login.sh es un sistema de acceso para los usuarios'
		;;
		fecha)
			echo 'El comando fecha.sh te muestra la fecha actual'
		;;
		hora)
			echo 'El comando hora.sh te muestra la hora actual'
		;;
		buscar)
			echo 'El comando buscar.sh busca un archivo especifico en un directorio especifico'
		;;
		prompt)
			echo 'El prompt es lo que nos permitira interpretar nuestros comandos en la prebeSHell'
		;;
		prebeplayer)
			echo 'El prebeplayer.sh es un reproductor de musica'
		;;
		tree)
			echo 'El comando tree.sh te muestra tu directorio actual, y los que se encuentran en este directorio, con una amigable forma de arbol'
		;;
		tree)
			echo 'AdivinaQuien.sh es un juego en el que te hacen preguntas sobre tu Becario de Proteco favorito'
		;;
		adivinaquien)
			echo 'cuadromagico.sh es un juego en el que debes tener la misma suma en cada fila, columna y diagonal'
		;;
		juegopuertas)
			echo 'juegoPuertas.sh es un juego donde tienes que adivinar la salida para ganar un dulce'
		;;
		interfazcrontab)
			echo 'El comando interfazCrontab.sh te permite asignar tareas a una hora y fecha especifica'
		;;
		ayuda)
			echo 'El comando ayuda.sh te muestra la descripcion de cualquier comando que quieras'
		;;
		creditos)
			echo 'El comando creditos.sh muestra a los creadores de esta prebeShell'
		;;
esac
}
ayuda $1
