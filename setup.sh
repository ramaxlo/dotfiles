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

setup_i3()
{
	echo "Setup i3 config"

	mkdir -p ~/.config/i3
	cp -a i3/* ~/.config/i3
}

setup_polybar()
{
	echo "Setup polybar config"

	mkdir -p ~/.config/polybar
	cp -a polybar/* ~/.config/polybar
}

setup_rofi()
{
	echo "Setup rofi config"

	mkdir -p ~/.config/rofi
	cp -a rofi/* ~/.config/rofi
}

setup_font()
{
	echo "Setup awesome font"

	mkdir -p ~/.fonts

	unzip -d /tmp -q fontawesome-free-5.10.2-desktop.zip
	find /tmp/fontawesome-free-5.10.2-desktop -name "*.otf" -exec mv {} ~/.fonts \;
	fc-cache

	rm -rf /tmp/fontawesome-free-5.10.2-desktop
}

setup_wallpaper()
{
	echo "Setup wallpapers"

	cp -a wallpapers ~/
	feh --bg-fill ~/wallpapers/structure.png
}

setup_termcolor()
{
	echo "Setup terminal color"

	cp Xresources ~/.Xresources
	cp -a Xresources.d ~/.Xresources.d

	cp -a xfce4 ~/.config
}

setup_compositor()
{
	echo "Setup compositor"

	cp compton.conf ~/.config
}

################
#    START
################

#check
#setup_bin
#setup_tmux
#setup_shell
#setup_vim
#setup_gitconfig
setup_i3
setup_polybar
setup_rofi
setup_font
setup_wallpaper
setup_termcolor
setup_compositor

echo "Done"
