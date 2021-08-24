#!/usr/bin/env bash

NOME="Gabriel Santana"
echo "$NOME"

NUMERO_1=24
NUMERO_2=45

TOTAL=$((NUMERO_1+NUMERO_2))
echo "$TOTAL"

echo "_______________________"

echo "parâmetro 1: $1"
echo "parâmetro 2: $2"
echo "Todos os parâmetros: $*"
echo "Quantos parâmetros? $#"
echo "Saída do último comando: $?"
echo "PID: $$"
echo $0
