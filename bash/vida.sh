#!/bin/bash

FECHA=$1
RES=
LISTA=
HOY=$(date +%s)

DIA=$(echo $FECHA | cut -d '-' -f 1)
MES=$(echo $FECHA | cut -d '-' -f 2)
ANIO=$(echo $FECHA | cut -d '-' -f 3)

LISTA=$(date -d "$MES/$DIA/$ANIO") 
RES=$? && [ $RES -ne 0 ] && exit 1
LISTA=$(date +%s --date "$MES/$DIA/$ANIO")

DIFERENCIA=$(($HOY-$LISTA))

echo $(($DIFERENCIA/(3600*24)))




exit 0
