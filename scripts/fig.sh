#!/usr/bin/env bash
src=$(command figlet -I 2)
# font=$(command ls "$src" | fzf)
font=$(command ls "$src" | rofi -p "Selecione a fonte" -i -auto-select -only-match -no-custom -dmenu)
echo "$font"
par=$(command echo '1 - TST|2 - TST2' | rofi -p 'tst' -sep '|' -format i -i -auto-select -only-match -no-custom -dmenu)
echo "$par"
# example% figlet -f lean | tr ' _/' ' ()'
# example% figlet -f lean | tr ' _/' './\\'
# example% figlet -f lean | tr ' _/' ' //'
# example% figlet -f lean | tr ' _/' '/  '
