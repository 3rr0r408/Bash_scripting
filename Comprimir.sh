
#Solicita los valores de entrada Ruta y cantidad de veces a comprimir
echo "Ingresa el nombre del archivo"
read archivo

sleep .5

echo "Cuantas veces desea comprimirlo?"
read veces

sleep .5

#variables de comparacion
n=$(( $veces - 1 ))
a=$archivo

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
        #Elimina todos los archivos menos el primero (original) y el ultimo (Resultado)
        i=1
        while [ $i -le $n ]
        do
                rm -rf $a$zip
                a=$a$zip
                ((i++))
        done
        break

done
