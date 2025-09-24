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

# Plugin ALE
# https://github.com/dense-analysis/ale
# https://www.arthurkoziel.com/setting-up-vim-for-yaml/

sudo apt install yamllint
mkdir -p ~/.config/yamllint
cat > ~/.config/yamllint/config <<EOF
extends: relaxed

rules:
  line-length: disable
EOF

mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

# Création du fichier

cat > ~/.vimrc <<EOF
runtime defaults.vim
let g:indentLine_char = "▏"
set nu
colors desert
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
EOF
