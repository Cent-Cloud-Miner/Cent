
Debian
====================
This directory contains files used to package centd/cent-qt
for Debian-based Linux systems. If you compile centd/cent-qt yourself, there are some useful files here.

## cent: URI support ##


cent-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install cent-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your centqt binary to `/usr/bin`
and the `../../share/pixmaps/cent128.png` to `/usr/share/pixmaps`

cent-qt.protocol (KDE)

