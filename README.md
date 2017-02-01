# [Dotfiles](https://github.com/mrorgues/dotfiles)

Welcome to my world! This is a collection of vim and zsh configurations. 

![Vim 8](/images/dotfiles.png)

## Requirements

Please make sure the followings elements are already installed:
* [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) ([Oh My ZSH!](http://ohmyz.sh/) is recommanded.)
* [Vim](http://www.vim.org/)
* [Git](https://git-scm.com/)
* [Universal-ctags](https://github.com/universal-ctags/ctags/blob/master/docs/autotools.rst) 
* [Font Config](https://www.freedesktop.org/wiki/Software/fontconfig) (Most likely installed by default.)

## Compatibility

* macOS (previously Mac OS X, then OS X) 
* GNU / Linux

## Vim 8 (Optional but recommanded)

You want the latest Vim features (like the command ":smile" ;-) ) ?

###### If so, run the following command lines:

```
$ git clone https://github.com/vim/vim.git && cd vim
$ ./configure --prefix=/usr/local
$ make
$ sudo make install 
```

## Installation

###### Run the following command lines:

```
$ TEMP_DIR_CONF=/tmp/personal_configuration && mkdir -p $TEMP_DIR_CONF && cd $TEMP_DIR_CONF
$ git clone git@github.com:mrorgues/dotfiles.git && cd dotfiles 
$ zsh install.sh && cd $HOME
$ rm -rf $TEMP_DIR_CONF
$ source ~/.zshrc
```
