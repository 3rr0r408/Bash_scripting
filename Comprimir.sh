#!/bin/bash

#Solicita los valores de entrada Ruta y cantidad de veces a comprimir
echo "Ingresa el nombre del archivo"
read archivo

sleep .5

echo "Cuantas veces desea comprimirlo?"
read veces

sleep .5

while true
do
        echo "Comprobando ficheros"
        sleep 1
        #comprueba si el fichero existe
        #si no existe cancela el script
        if [ -f $archivo ]
        then
                echo "Existe!!"
                sleep 1
        else
                echo "El fichero no existe"
                break
        fi
        #Comprime el fichero la cantidad de veces indicada
        echo "Comprimiendo $archivo $veces veces"
        i=0
        zip=".zip"
        while [ $i -lt $veces ]
        do
                zip $archivo$zip $archivo
                archivo=$archivo$zip
                ((i++))
        done
        break
done
