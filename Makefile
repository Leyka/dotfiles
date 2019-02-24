install:
	xargs -d '\n' -a packages/packages.list yay --noconfirm --needed -S

install-laptop: install
	xargs -d '\n' -a packages/laptop.list yay --noconfirm --needed -S
