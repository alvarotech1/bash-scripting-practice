#!/bin/bash

FILE=$1
INDICE=0
LIMITE=$(wc -l $FILE | cut -d " " -f 1)
while [ $INDICE -ne $LIMITE ]
do
AUX=$(head -n 1 $FILE)
tail -n 1 $FILE
echo "$AUX" >> hola.txt
sed  -i "1d" $FILE
((INDICE++))
done
