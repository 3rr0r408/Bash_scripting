#!/bin/bash
read -p "Mete un numero: " n

#Obliga a ingresar un parametro para la ejecucion correcta del programa
while true
do
	if [ -z $n ]
	then
		echo "Debes ingresar un numero"
	read n
	else
		break
	fi
done
	echo "has ingresado $n"
	#Variable de comparacion
	re="^[0-9]+$"
while true
do
	#Compara la variable ingresada y en caso de que este no sea un numero
        #Cancela la ejecucion 
	if ! [[ $n =~ $re ]]
	then
		echo "No es un numero"
		break
	else
		echo "$n es un valor valido"
	fi
	#Evita que el vaor ingresado sea menor que 0
	if [ $n -lt 0 ]
	then
		echo "no puede ser menor que 0"
		break
	fi
	#Muestra por pantalla los valores solo si el resto de la division entre
        # $n/$i es igual a 0, ya que eso significa que ese valor es divisor
	i=1
	echo "Los divisores de $n son:"
	while [ $i -le $n ]
	do
		if [[ $(($n % $i)) == 0 ]]
		then
			echo $i
		fi
	let i=$i+1
	done
	break
done
