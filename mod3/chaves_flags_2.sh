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
#        - Adicionamos os parêmetros -s -h e -v
#   v1.1 24/08/2021, Gabriel
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
  $(basename $0) [OPÇÕES]

    -h - Menu de Ajuda
    -v - Versão do Programa
    -s - Ordenar a Saída"

VERSAO="V1.1"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
case "$1" in
  -h) echo "$MENSAGEM_USO" && exit 0      ;;
  -v) echo "$VERSAO" && exit 0            ;;
  -s) echo "$USUARIOS" | sort && exit 0   ;;
   *) echo "$USUARIOS" && exit 0          ;;
esac
# ------------------------------------------------------------------------ #
