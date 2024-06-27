#!/bin/bash

DIRECTORIO=/home/alvaro/Escritorio/SISTEMASOPERATIVOS/programas/bash
cd $DIRECTORIO
FILE1=usuarios.txt
FILE2=claves.txt
[ $(wc -l $FILE1 | cut -d " " -f 1) -eq 0 ] && echo "Error, archivo 1 esta vacio" && exit 1
[ $(wc -l $FILE2 | cut -d " " -f 1) -eq 0 ] && echo "Error, archivo 2 esta vacio" && exit 1
[ $( wc -l $FILE1 | cut -d " " -f 1)  -ne $( wc -l $FILE2 | cut -d " " -f 1) ] && echo "no matchean las lines entre los dos archivos" && exit 1 
touch passwd.txt
LIMITE=$(wc -l $FILE1 | cut -d " " -f 1)
CONT=1
while [ $CONT -le $LIMITE ]
do
UNO=1
NOMBRE=$(head -n 1 $FILE1)
echo "$NOMBRE" >> $FILE1
sed -i "1d" $FILE1
CLAVE=$(head -n 1 $FILE2)
echo "$CLAVE" >> $FILE2
sed -i "1d" $FILE2
AUX=$(echo -n "$NOMBRE" && echo -n ":" && echo -n "$CLAVE")
echo "$AUX" >> passwd.txt

((CONT++))
done

exit 0
