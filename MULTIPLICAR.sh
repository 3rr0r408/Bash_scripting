#!/bin/bash
while true
do
        echo "ejecutamos la tabla de multiplicar del $2"

        case $1 in
        "-f")

        i=0
        while [ $i -le 10 ]
        do
                let value=$2*$i
                echo "$2 x $i = $value"

                if ! [ -d tabla$2.txt ]
                then
                        touch tabla$2.txt
                fi
                echo "$2 x $i = $value" >> tabla$2.txt

                let i=$i+1
        done

        ;;
        *)
        echo "El primer parametro debe ser -f"
        ;;
        esac

        break
done
