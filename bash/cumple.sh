#!/bin/bash

FECHA=$1
RES=
LISTA=
DIA_SEMANA=

DIA=$(echo $FECHA | cut -d '-' -f 1)
MES=$(echo $FECHA | cut -d '-' -f 2)
ANIO=$(echo $FECHA | cut -d '-' -f 3)

LISTA=$(date -d "$MES/$DIA/$ANIO") 
RES=$? && [ $RES -ne 0 ] && exit 1

DIA_SEMANA=$(echo $LISTA | cut -d ' ' -f 1)



case $DIA_SEMANA in
lun)DIA_SEMANA= echo "Lunes";;
mar)DIA_SEMANA= echo "Martes";;
mie)DIA_SEMANA= echo "Miercoles";;
jue)DIA_SEMANA= echo "Jueves";;
vie)DIA_SEMANA= echo "Viernes";;
sab)DIA_SEMANA= echo "Sabado";;
dom)DIA_SEMANA= echo "Domingo";;
esac


exit 0
