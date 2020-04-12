# =======================
#  ~~ INSTALLATION ~~
# =======================

install:
	xargs -L 1 -a packages/packages.list yay --noconfirm --needed -S

install-laptop: install
	xargs -L 1 -a packages/laptop.list yay --noconfirm --needed -S

install-extra:
	xargs -L 1 -a packages/extra.list yay --noconfirm --needed -S

# ======================
#  ~~ CONFIGURATION ~~
# ======================

configure: fish vim vscode git guake

configure-extra: docker

fish:
	cp -a config/fish ~/.config
	chsh -s `which fish`

vim:
	cp config/vim/.vimrc ~

vscode:
	\cp -r config/vscode/settings.json ~/.config/Code/User
	xargs -L 1 -a config/vscode/extensions.list code --install-extension

git:
	git config --global core.editor "vim"

guake:
	ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/

docker:
	systemctl enable docker.service
	systemctl start docker.service
