#!/bin/bash -e

sudo apt-get clean
sudo mv /var/lib/apt/lists /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update

# TODO: cross-check this list against final ubuntu os script
# Install packages for Go
echo "================= Install packages for Go ==================="
apt-get update && apt-get install -y \
	autotools-dev \
	autoconf \
	bison \
	git \
	mercurial \
	cmake \
	scons \
	binutils \
        gcc \
        bzr

# Install gvm
echo "================= Install gvm ==================="
curl -s -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash

export CGO_ENABLED=0
/u16golall/go_install.sh
