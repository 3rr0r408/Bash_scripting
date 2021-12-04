#!/bin/bash
read -p "Mete un numero: " n
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
	re="^[0-9]+$"
while true
do
	if ! [[ $n =~ $re ]]
	then
		echo "No es un numero"
		break
	else
		echo "$n es un valor valido"
	fi
	if [ $n -lt 0 ]
	then
		echo "no puede ser menor que 0"
		break
	fi
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
