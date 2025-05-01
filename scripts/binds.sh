#!/bin/bash

hypr="$HOME/.config/hypr/conf/binds.conf"
saida="$HOME/.config/scripts/binds.txt"

# Limpa o arquivo de saida antes de começar a escrever
> "$saida"

command grep /"bind*/" $saida
