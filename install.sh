#!/bin/zsh
set -e

# Custom colors
GREEN='\033[0;32m'
NORMAL='\033[0m'
RED='\033[0;31m'

# Check Requirements
REQUS=(zsh vim git ctags fc-cache)
for REQU in "${REQUS[@]}"
do
    command -v $REQU >/dev/null 2>&1 || { echo "${RED}Sorry! $REQU is required but doesn't seem to be installed. Aborting.\nFind more information in README.md.${NORMAL}" >&2; exit 1; }
done

# Parameters
SCRIPT_PATH=`pwd -P`
ZSHRC=~/.zshrc

# Install a wonderful font 
echo "${GREEN}Installing a wonderful font ... \n ${NORMAL}"
if [[ `uname` == 'Darwin' ]]; then
    #
  # MacOS
  FONT_DIR="$HOME/Library/Fonts"
else
  # Linux
  FONT_DIR="$HOME/.local/share/fonts"
  mkdir -p $FONT_DIR
fi
cd $FONT_DIR && curl -fLo "Meslo LG L Regular for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/complete/Meslo%20LG%20L%20Regular%20for%20Powerline%20Nerd%20Font%20Complete.otf
fc-cache -f $FONT_DIR
cd $SCRIPT_PATH

# Download Plug: A minimalist plugin manager for vim
echo "\n${GREEN}Downloading 'Plug': A minimalist plugin manager for vim ... \n ${NORMAL}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set configuration
echo "\n${GREEN}Setting configurations (dot files and general settings) ... \n ${NORMAL}"
# vimrc
if [ -f ~/.vimrc ]; then
    mv -f ~/.vimrc ~/.vimrc.back
fi
cp vimrc ~/.vimrc
# ctags
if [ -f ~/.ctags ]; then
    mv -f ~/.ctags ~/.ctags.back
fi
cp ctags ~/.ctags

# pep8: global configuration
if [ -f ~/.pep8 ]; then
    mv -f ~/.pep8 ~/.pep8.back 
fi
cp pep8 ~/.pep8
# git global gitignore
if [ -f ~/.gitignore_global ]; then
    mv -f ~/.gitignore_global ~/.gitignore_global.back
fi
cp gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Copy personal scripts
echo "\n${GREEN}Copying personal scripts ... \n ${NORMAL}"
mkdir -p $HOME/personal_scripts
cp -Rf personal_scripts/* $HOME/personal_scripts
chmod -R +x $HOME/personal_scripts

# Customizing $PATH
echo "\n${GREEN}Customizing \$PATH ... \n ${NORMAL}"
CUSTOM_PATHS=("PATH=\$PATH:\$HOME/personal_scripts")
for CUSTOM_PATH in "${CUSTOM_PATHS[@]}"
do
    if ! grep -q $CUSTOM_PATH $ZSHRC; then
        echo $CUSTOM_PATH >> $ZSHRC
        echo $CUSTOM_PATH" has been added to "$ZSHRC
    fi
done

# Install vim plugins
echo "${GREEN}Installing vim plugins ... \n ${NORMAL}"
if [ -d  ~/.vim/plugged/vim-colors-solarized ]; then
    rm -rf ~/.vim/plugged/vim-colors-solarized
fi
git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/plugged/vim-colors-solarized && cd $SCRIPT_PATH
vim +PlugInstall +qall

# Add aliases (if necessary)
echo "${GREEN}Adding personal aliases (if necessary) ... \n ${NORMAL}"
PERSONAL_ALIASES=("alias lsd='ls -Ad .*'" "alias llsd='ls -Ald .*'" "alias vi='vim'")
for PERSONAL_ALIAS in "${PERSONAL_ALIASES[@]}"
do
    if ! grep -q $PERSONAL_ALIAS $ZSHRC; then
        echo $PERSONAL_ALIAS >> $ZSHRC
        echo $PERSONAL_ALIAS" has been added to "$ZSHRC
    fi
done

# Congratulations !
echo "\n${GREEN}The installation was completed successfully! ${NORMAL}"
