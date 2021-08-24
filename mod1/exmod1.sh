#!/usr/bin/env bash

echo "Exercicio Final Módulo 1"
for (( i = 0; i < 11; i++ )); do
   resto=$((i%2))
   [ "$resto" -eq 0 ] && echo "$i é divisivel por 2"
done
