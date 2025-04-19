#!/bin/bash
#
# 2024-12-16
#

# Vérification de l'existence du fichier

if [ -e ~/.vimrc ]
then
  echo "Le fichier ~/.vimrc est déjà présent"
  exit 1
fi

# Barre verticale

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

# Plugin surround
# https://github.com/tpope/vim-surround

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q

# Création du fichier

cat > ~/.vimrc <<EOF
runtime defaults.vim
let g:indentLine_char = "▏"
set nu
colors desert
EOF
