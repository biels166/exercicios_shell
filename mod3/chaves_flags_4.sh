#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai usuarios do /etc/passwd
#
# Site:       https://github.com/biels166
# Autor:      Gabriel Santana
# Manutenção: Gabriel Santana
#
# ------------------------------------------------------------------------ #
#  Irá extrair a lista de usuarios do /etc/passwd havendo a possibilidade de
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
#        - If aprimorado para Case
#        - Adicionamos basename
#   v1.2 24/08/2021, Gabriel
#        - Adicionamos -m
#        - Adicionamos as CHAVE_ORDENA e CHAVE_MAIUSCULO
#   v1.3 24/08/2021, Gabriel
#        - Adicionamos while com shift e teste de variavel
#        - Adicionamos 2 flags
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

VERSAO="V1.3"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"
do
  case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0                 ;;
    -v) echo "$VERSAO" && exit 0                       ;;
    -s) CHAVE_ORDENA=1                                 ;;
    -m) CHAVE_MAIUSCULO=1                              ;;
     *) echo "Erro ! Válide o comando em -h" && exit 1 ;;
  esac
  shift
done

[ $CHAVE_ORDENA -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #
