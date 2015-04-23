#!/bin/sh

setup_bin()
{
	echo "Setup bin"

	if [ ! -d ~/bin ]; then
		mkdir ~/bin
	fi

	cp -a bin/* ~/bin
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
	if ! which git > /dev/null 2>&1; then
		echo "Please install git"
		exit 1
	fi
}

################
#    START
################

check
setup_bin
setup_tmux
setup_shell
setup_vim

echo "Done"
