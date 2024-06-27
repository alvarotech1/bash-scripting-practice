#!/bin/bash

echo -n "Ingrese un directorio: "
read DIRECTORIO
echo "DIRECTORIO = $DIRECTORIO"

echo -n "Ingrese extension: "
read EXTENSION
echo "EXTENSION = $EXTENSION"

echo -n "Ingrese un patrón de renombre: "
read PATRON
echo "PATRON = $PATRON"

SALIDA=$(ls "$DIRECTORIO" | grep '\'$EXTENSION)
I=1
echo "$SALIDA"
for f in $SALIDA
do
  mv "$DIRECTORIO/$f" "$DIRECTORIO/$PATRON$I$EXTENSION"
  ((I++))
done

exit 0
