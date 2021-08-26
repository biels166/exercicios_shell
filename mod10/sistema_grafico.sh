#!/usr/bin/env bash

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"
SEP=:
TEMP=temp.$$ #Cria um arquivo de backup temporario do banco de dados ou execução
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO!! Não Arquivo não existe" && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO!! Não temos acesso de leitura" && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO!! Não é possível escrever" && exit 1
[ ! -x "$(which dialog)"] && sudo apt-get install dialog 1> /dev/null 2>&1
#redirecionamento das mensagem. Não é obrigatório, apenas mantem o terminal limpo.

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
ListaUsuarios () {
  egrep -v "^#|^$" "$ARQUIVO_BANCO_DE_DADOS" | tr "$SEP" ' ' > "$TEMP"
  dialog --title "Lista de Usuarios" --textbox "$TEMP" 20 40
  rm -f "$TEMP"
}

ValidaUsuarios () {
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
# -i é ignora diferença de maiuscula e minuscula
# -q é quiet - não mostra no terminal
}

OrdenaLista () {
  sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while :
do
  acao=$(dialog --title "Gerenciamento de Usuarios" \
                --stdout \
                --menu "Escolha uma das opções abaixo" \
                0 0 0 \
                listar "Listar Todos os Usuarios" \
                inserir "Inserir Novo Usuario" \
                remover "Remover Usuario")
  [ $? -ne 0 ] && continue

 case "$acao" in
   lista) ListaUsuarios ;;
   inserir)
     ultimo_id="$(egrep -v "^#|^$" $ARQUIVO_BANCO_DE_DADOS | sort | tail -n 1 | cut -d "$SEP" -f 1)"
     nova_id="$(($ultimo_id+1))"

     nome=$(dialog --title "Cadastro de Usuários" --stdout --inputbox  "Digite o seu nome" 0 0)
     [ ! "$nome" ] && exit 1
     #--stdout envia a string digitada para a variavel
       ValidaUsuarios "$nome" && {
         dialog --title "ERRO" --msgbox "Usuario já Cadastrado" 6 40
         exit 1
       }

     email=$(dialog --title "Cadastro de Usuários" --stdout --inputbox  "Digite o seu email" 0 0)
     [ ! "$email" ] && exit 1
     #--stdout envia a string digitada para a variavel
       ValidaUsuarios "$email" && {
         dialog --title "ERRO" --msgbox "Usuario já Cadastrado" 6 40
         exit 1
       }
       [ $? -ne 0 ] && continue

       echo "$nova_id$SEP$nome$SEP$email" >> "$ARQUIVO_BANCO_DE_DADOS"
       dialog --title "SUCESSO" --msgbox "Usuario Cadastrado com Sucesso" 6 40

       ListaUsuarios
   ;;
   remover)
    usuarios=$(egrep "^#|^$" -v "$ARQUIVO_BANCO_DE_DADOS" \
                     | sort -h \
                     | cut -d "$SEP" -f 1,2 \
                     | sed 's/:/ "/;s/$/"/')
    id_apagado=$(eval dialog --stdout --menu \"Escolha um Usuario:\" 0 0 0 $usuarios)
    [ $? -ne 0 ] && continue

     grep -i -v "^$id_apagado" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
     mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

     dialog --magbox "usuario removido com sucesso" 0 0
     ListaUsuarios
     #sort -h serve para ordenar numericamente
     #sed irá substituir (s/) A/B ; separa a próxima troca
     #eval transforma a saida em string evitando erros de leitura do dialog
     # \ \ evita erros encapsulamento por parte eval, tornando "" normais
   ;;
 esac
done

# ------------------------------------------------------------------------ #
