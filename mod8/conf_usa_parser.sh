#!/usr/bin/env bash
# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_CONFIGURACAO="configuracao.cf"
USAR_CORES=
USAR_MAIUSCULA=
MENSAGEM="Mensagem de Teste."

VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #
# ------------------------------- EXECUÇÃO ----------------------------------------- #
eval $(./parser.sh $ARQUIVO_DE_CONFIGURACAO)

[ "$(echo $CONF_USAR_MAIUSCULA)" = 1 ] && USAR_MAIUSCULA=1
[ "$(echo $CONF_USAR_CORES)" = 1 ] && USAR_CORES=1

[ "$USAR_MAIUSCULA" = "1" ] && MENSAGEM="$(echo -e "$MENSAGEM" | tr [a-z] [A-Z])"
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERMELHO}"$MENSAGEM")"

echo "$MENSAGEM"
# ------------------------------------------------------------------------ #
