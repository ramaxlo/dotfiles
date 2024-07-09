#!/bin/bash

setup_bin()
{
	echo "Setup bin"

	if [ ! -d ~/bin ]; then
		mkdir ~/bin
	fi

	cp -a bin/* ~/bin

	echo "Clone grabserial repo"
	git clone https://github.com/ramaxlo/grabserial.git
	cp grabserial/grabserial ~/bin
	rm -rf grabserial

	echo "Install go related binaries"
	tar Jxf go_bin.tar.xz -C ~/bin
}

setup_tmux()
{
	echo "Setup tmux"

	cp tmux.conf ~/.tmux.conf
}

setup_shell()
{
	echo "Setup bashrc"

	local BASHSETUP='source ~/dotfiles/bashrc'

	if ! grep -q "$BASHSETUP" ~/.bashrc; then
		echo $BASHSETUP >> ~/.bashrc
	fi
}

setup_vim()
{
	echo "Setup VIM"

	cp vimrc ~/.vimrc

	if [ ! -d ~/.vim ]; then
		mkdir -p ~/.vim/plugin
	fi

	if [ ! -d ~/.vim/plugin ]; then
		mkdir -p ~/.vim/plugin
	fi

	if [ ! -d ~/.vim/bundle ]; then
		mkdir -p ~/.vim/bundle
	fi

	cp cscope_maps.vim ~/.vim/plugin
	cp -a templates ~/.vim/

	cd ~/.vim
	unzip ~/dotfiles/ColorSamplerPack.zip
	cd - > /dev/null

	cd ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git
	cd - > /dev/null

	vim +PluginInstall +qa
}

check()
{
	local PASS='1'

	if ! which git > /dev/null 2>&1; then
		echo "Please install git"
		PASS='0'
	fi

	if ! which vim > /dev/null 2>&1; then
		echo "Please install vim"
		PASS='0'
	fi

	if [ "$PASS" == '0' ]; then
		exit 1
	fi
}

setup_gitconfig()
{
	echo "Setup gitconfig"

	cp gitconfig ~/.gitconfig
}

################
#    START
################

check
setup_bin
setup_tmux
setup_shell
setup_vim
setup_gitconfig

echo "Done"
