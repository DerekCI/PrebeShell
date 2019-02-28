#! /bin/bash



ayuda()
{
	echo 'Este comando te da la descripcion de cada comando'

	echo '¿De que comando quieres ayuda?'
	echo '1)Login. 2)Fecha. 3)Hora. 4)Buscar. 5)Prompt. 6)PrebePlayer. 7)Tree. 8)Adivina Quien. 9)Cuadro Magico. 10)juegoPuertas. 11)Interfaz Crontab. 12)Creditos.'
	
	case $1 in:
		1)
			echo 'El comando login.sh es un sistema de acceso para los usuarios'
		;;
		2)
			echo 'El comando fecha.sh te muestra la fecha actual'
		;;
		3)
			echo 'El comando hora.sh te muestra la hora actual'
		;;
		4)
			echo 'El comando buscar.sh busca un archivo especifico en un directorio especifico'
		;;
		5)
			echo 'El comando prompt.sh'
		;;
		6)
			echo 'El prebeplayer.sh es un reproductor de musica'
		;;
		7)
			echo 'El comando tree.sh te muestra tu directorio actual, y los que se encuentran en este directorio, con una amigable forma de arbol'
		;;
		8)
			echo 'AdivinaQuien.sh es un juego en el que te hacen preguntas sobre tu Becario de Proteco favorito'
		;;
		9)
			echo 'cuadromagico.sh'
		;;
		10)
			echo 'juegoPuertas.sh es un juego donde tienes que adivinar la salida para ganar un dulce'
		;;
		11)
			echo 'El comando interfazCrontab.sh te permite asignar tareas a una hora y fecha especifica'
		;;
		12)
			echo 'El comando creditos.sh muestra a los creadores de esta prebeShell'
		;;
esac
}
switch $1