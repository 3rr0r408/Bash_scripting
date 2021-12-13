#!/bin/bash
while true
do
	#Resetear la lista para evitar problemas
	if [ -n lista.txt ]
	then
		echo "El fichero lista.txt tiene contenido"
		echo "Desea borrar este contenido? (y/n)"
		read delete
	fi
	if [ $delete == y ]
	then
		echo "Limpiando lista.txt"
		rm -rf lista.txt
		touch lista.txt
		sleep 1
	elif [ $delete == n ]
	then
		echo "El proceso no puede continuar si lista.txt no esta vacio"
		break
	fi
	#Comprobar que se ingresen siempre 2 parametros
	if [ $# -gt 2 ]
	then
		echo "debes ingresar solo 2 parametros"
		break
	elif [ $# -lt 2 ]
	then
		echo "debes ingresar minimo 2 parametros"
		break
	else
		echo -e "Almacenando parametro $2"
		wrd="$2"
		sleep 1
	fi
	#Comprueba que el parametro que indica la ruta del directorio sea correcto
	if [ -d $1 ]
	then
		echo "$1 es una ruta valida"
		sleep 1
		echo "Almacenando parametro $1"
		ruta="$1"
	else
		echo "$1 no es un Directorio o no existe"
		sleep .5
		echo "Debes ingresar una ruta valida"
		break
	fi
	#Busca los ficheros dentro de la ruta indicada
	ficheros=(`find $ruta -type f`)
	#Comprueba si la cadena de texto indicada se encuentra en el fichero
	#Y si es asi agrega el nombre a listas.txt
	for i in "${ficheros[@]}"
	do
		contenido=`cat $i | grep $wrd`
		if [ -n "$contenido" ]
		then
			echo $i >> lista.txt
		fi
	done
	#Indica cuales son los documentos encontrados
	echo "Los Ficheros cuyo contenido coiciden con $wrd son:"
	pos=1
	while read line
	do
	echo "$pos: $line"
	done < lista.txt
	break
done
