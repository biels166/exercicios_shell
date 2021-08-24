#!/usr/bin/env bash

echo "Modelo 1 de for"
for (( i = 0; i < 10; i++ )); do
   echo $i
done

echo "Modelo 2 de for (seq)"
for i in $(seq 10); do
   echo $i
done

echo "Modelo 3 de for (array)"
Frutas=(
'Abacaxi'
'Maçã'
'Laranja'
'Banana'
'Ameixa'
)
for i in "${Frutas[@]}"; do
   echo $i
done

echo "Modelo com While"
contador=0
while [[ $contador -lt ${#Frutas[@]} ]]; do
    echo $contador
    contador=$(($contador+1))
done
