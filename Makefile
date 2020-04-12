install:
	xargs -L 1 -a packages/packages.list yay --noconfirm --needed -S

install-laptop: install
	xargs -L 1 -a packages/laptop.list yay --noconfirm --needed -S

install-extra:
	xargs -L 1 -a packages/extra.list yay --noconfirm --needed -S

configure:
	# ~~ Fish ~~
	cp -a config/fish ~/.config
	chsh -s `which fish`
	# ~~ Vim ~~
	cp config/vim/.vimrc ~
	# ~~ VS Code ~~
	cp config/vscode/settings.json ~/.config/Code\ -\ OSS/User
	xargs -L 1 -a config/vscode/extensions.list code --install-extension
	# ~~ Git ~~
	git config --global core.editor "vim"
