#!/usr/bin/bash

# install dependencies
sudo xbps-install -Sy git-all gcc make automake autoconf gtk-doc glib-devel vala-devel gobject-introspection pkg-config intltool gettext-devel gnutls gtk+3 pango gnutls-devel gtk+3-devel pango-devel gperf pcre2-devel

# fetch, compile and install vte-ng
git clone https://github.com/jelly/vte-ng.git
cd vte-ng
git checkout 0.50.2-ng 
./autogen.sh --prefix=/usr
make
sudo make install

# fetch, compile and install termite
cd ..
git clone --recursive https://github.com/thestinger/termite
cd termite
sed 's/PREFIX = \/usr\/local/PREFIX = \/usr/' -i Makefile
make
sudo make install
