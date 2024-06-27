#i/bin/bash

select i in "Perro" "Gato" "Pajaro"
do
case $i in  
"Perro") echo "soy un perro" ;;
"Gato") echo "soy un gato" ;;
"Pajaro") echo "soy un pajaro" ;;
esac
done
