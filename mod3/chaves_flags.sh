#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai usuarios do /etc/psswd
#
# Site:       https://github.com/biels166
# Autor:      Gabriel Santana
# Manutenção: Gabriel Santana
#
# ------------------------------------------------------------------------ #
#  Irá extrair a lista de usuarios do /etc/psswd havendo a possibilidade de
# colocar em maiusculo e em ordem alfabetica
#  Exemplos:
#      $ ./clistaUsuarios.sh -s -m
#      Neste exemplo ficará em maiusculoe  em ordem alfabetica
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 24/08/2021, Gabriel
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
# Agradecimentos:
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
  $0 [OPÇÕES]

    -h - Menu de Ajuda
    -v - Versão do Programa
    -s - Ordenar a Saída"

VERSAO="V1.0"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
if [[ "$1" = "-h" ]]; then
   echo "$MENSAGEM_USO" && exit 0
fi
if [[ "$1" = "-v" ]]; then
   echo "$VERSAO" && exit 0
fi
if [[ "$1" = "-s" ]]; then
   echo "$USUARIOS" | sort && exit 0
fi
# ------------------------------------------------------------------------ #
