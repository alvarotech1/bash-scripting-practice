#!/bin/bash

FILE=passwd.txt

echo -n "Ingrese Usuario: "
read USUARIO

echo -n "Ingrese Contrasenia: "
read -s CONTRASENIA


LIMITE=$(wc -l $FILE | cut -d " " -f 1)
CONT=1
while [ $CONT -le $LIMITE ]
do
NOMBRE=$(head -n 1 $FILE | cut -d ":" -f 1)
if [ "$USUARIO" = "$NOMBRE" ]
then
CLAVE=$(head -n 1 $FILE | cut -d ":" -f 2)
if [ "$CLAVE" = "$CONTRASENIA" ]
then
echo "La clave es correcta"
exit 0
fi
fi
LINEA_FILE=$(head -n 1 $FILE)
sed -i "1d" $FILE 
echo "$LINEA_FILE" >> passwd.txt

((CONT++))
done
echo "La clave es incorrecta"
exit 0

