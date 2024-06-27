#!/bin/bash

while true; do
PS3='Ingrese criterio de busqueda: '
select x in "Busqueda por tipo de archivo" "Busqueda por tamaño de archivo" "Busqueda segun los permisos del archivo"  "Busqueda por inodo"
    do
	PS3='Ingrese criterio de busqueda: '
	case $x in
	"Busqueda por tipo de archivo") PS3='Ingrese tipo de busqueda por archivo: '; echo -n "ingrese el directorio: "; read DIRECTORIO
					select j in "Directorio" "Archivo" "Pipe con nombre" "Simbolic link"
					do
					case $j in
					 "Directorio")find $DIRECTORIO -type d; break ;;
					 "Archivo")find $DIRECTORIO -type f; break ;;
					 "Pipe con nombre")echo -n "ingrese nombre del archivo: "; read NOMBRE ; find $DIRECTORIO -type f | grep $NOMBRE; break ;;
					 "Simbolic link")find $DIRECTORIO -type l;  break ;;
					  *) echo "Opcion incorrecta"; continue ;;
					   esac; done; PS3='Ingrese criterio de busqueda:'; break ;;
	"Busqueda por tamaño de archivo") PS3='Ingrese tipo de busqueda por tamaño: ';echo -n "ingrese el directorio: "; read DIRECTORIO 
					  select j in "Byte" "Kb" "Mb"
						do
						case $REPLY in 
						1)echo -n "Ingrese un tamaño de busqueda en BYTES: "; read CANTIDAD
						 echo -n "Ingrese rango mayor o menos de busqueda(+, - o =): "; read RANGO 
						if [ "$RANGO" = '+' ]
						then 
						find $DIRECTORIO -size $RANGO$CANTIDAD"c"
						elif [ "$RANGO" = '-' ]
						then
						find $DIRECTORIO -size $RANGO$CANTIDAD"c"
						else find $DIRECTORIO -size $CANTIDAD"c"
						fi; break ;;
						2)echo -n "Ingrese un tamaño de busqueda en KILOBYTES: "; read CANTIDAD
                                                 echo -n "Ingrese rango mayor o menos de busqueda(+, - o =): "; read RANGO 
                                                if [ "$RANGO" = '+' ]
                                                then 
                                                find $DIRECTORIO -size $RANGO$CANTIDAD"k"
                                                elif [ "$RANGO" = '-' ]
                                                then
                                                find $DIRECTORIO -size $RANGO$CANTIDAD"k"
                                                else find $DIRECTORIO -size $CANTIDAD"k"
                                                fi; break ;;
						3)echo -n "Ingrese un tamaño de busqueda en MEGABYTES: "; read CANTIDAD
                                                 echo -n "Ingrese rango mayor o menos de busqueda(+, - o =): "; read RANGO 
                                                if [ "$RANGO" = '+' ]
                                                then 
                                                find $DIRECTORIO -size $RANGO$CANTIDAD"M"
                                                elif [ "$RANGO" = '-' ]
                                                then
                                                find $DIRECTORIO -size $RANGO$CANTIDAD"M"
                                                else find $DIRECTORIO -size $CANTIDAD"M"
                                                fi; break ;;
						*) echo "Opcion incorrecta"; continue ;;
						esac
						done; PS3='Ingrese criterio de busqueda:'; break ;;
	"Busqueda segun los permisos del archivo") PS3='Ingrese tipo de busqueda por permisos: '; echo -n "ingrese el directorio: "; read DIRECTORIO
					select x in "Solo Lectura" "Solo Escritura" "Solo Ejecucion" "Todos juntos" "Escritura/Lectura" "Escritura/Ejecucion" "Lectura/Ejecucion"
						do
						 case $REPLY in
						  1)find $DIRECTORIO -perm 400; break ;;
						  2)find $DIRECTORIO -perm 100; break ;;
						  3)find $DIRECTORIO -perm 200; break ;;
						  4)find $DIRECTORIO -perm 700; break ;;
                                                  5)find $DIRECTORIO -perm 600; break ;;
                                                  6)find $DIRECTORIO -perm 300; break ;;
                                                  7)find $DIRECTORIO -perm 500; break ;;
                                                  *) echo "Opcion incorrecta"; continue ;;
						  esac
                                                  done ; PS3='Ingrese criterio de busqueda: '; break ;;
	"Busqueda por inodo") echo -n "Ingrese un numero para busqueda por inodo:  "; read INODO
                                                 echo -n "Ingrese rango mayor o menos de busqueda(+, - o =): "; read RANGO 
                                                if [ "$RANGO" = '+' ]
                                                then 
                                                find $DIRECTORIO  -inum $RANGO$INODO
                                                elif [ "$RANGO" = '-' ]
                                                then
                                                find $DIRECTORIO -inum $RANGO$INODO
                                                else find $DIRECTORIO -inum $INODO
                                                fi; PS3='Ingrese criterio de busqueda:'; break ;;

	*) echo "opcion incorrecta"; continue ;;
	esac
   done
	PS3='Opcion: '
	select p in "Continuar" "Salir"
	do
	case $REPLY in
	1) break ;;
	2) break 2 ;;
	*) echo "Opcion incorrecta"; continue ;;
	esac; done 
done
exit 0 
