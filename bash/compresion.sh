#!/bin/bash

cd $1
[ $? -eq 1 ]  &&  exit 1 
RUTA=$1
NOMBRE=$2
TAM=
RUTA1=$(echo "$RUTA/*")
TAM=$(du -b $RUTA | cut -f 1)

echo "$TAM"



tar -cjf $NOMBRE.tar.bz2 $RUTA1 
TAM=$(du -b $NOMBRE.tar.bz2 | cut -f 1)

echo "$TAM"
