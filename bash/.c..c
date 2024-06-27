#!/bin/bash


FILE=$1
CANT=$(wc -l $FILE | cut -d ' ' -f 1)
INDICE=0
AUX=1
AUX2=
 
while [ $INDICE -lt $CANT ]
do
tail -n $AUX $FILE
AUX2=$(head -n $AUX $FILE)
sed -i '1d' $FILE 
echo "$AUX2" >> hola.txt
((INDICE++))

done

exit 0
