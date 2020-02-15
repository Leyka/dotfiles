install:
	xargs -d '\n' -a packages/packages.list yay --noconfirm --needed -S

install-laptop: install
	xargs -d '\n' -a packages/laptop.list yay --noconfirm --needed -S

configure:
	# ~~ Fish ~~
	cp -a config/fish ~/.config
	chsh -s `which fish`
	# ~~ Vim ~~
	cp config/vim/.vimrc ~
	# ~~ VS Code ~~
	cp config/vscode/settings.json ~/.config/Code\ -\ OSS/User
	chmod +x config/vscode/install-extensions.sh
	./config/vscode/install-extensions.sh
