#!/usr/bin/env bash

VAR=""
VAR2=""

if [[ "$VAR" = "$VAR2" ]]; then
   echo "São Iguais."
fi

if test "$VAR" = "$VAR2"; then
   echo "São Iguais."
fi

if [[ "$VAR" = "$VAR2" ]]
then
   echo "São Iguais."
fi

if test "$VAR" = "$VAR2"
then
   echo "São Iguais."
fi

[ "$VAR" = "$VAR2" ] && echo "São Iguais."
[ "$VAR" = "$VAR2" ]

echo "_______"
echo "Exercicio Aula de IFs"

echo "Parâmetro enviado: $1"
if [[ "$1" -gt 10 ]]; then
   echo $0
   echo "PID: $$"
fi
