#!/bin/bash -e

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
	binutils

# Install gvm
echo "================= Install gvm ==================="
curl -s -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash

# Set the source path of gvm. $HOME points to '/root'
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source $HOME/.gvm/scripts/gvm

# Install Go 1.1
echo "================= Install Go 1.1 ==================="
gvm install go1.1 --prefer-binary && gvm use go1.1 && go install -a -race std && go get -u github.com/tools/godep

# Install Go 1.2
echo "================= Install Go 1.2 ==================="
gvm install go1.2 --prefer-binary && gvm use go1.2 && go install -a -race std && go get -u github.com/tools/godep

# Install Go 1.3
echo "================= Install Go 1.3 ==================="
gvm install go1.3 --prefer-binary && gvm use go1.3 && go install -a -race std && go get -u github.com/tools/godep

# Install Go 1.4
echo "================= Install Go 1.4 ==================="
gvm install go1.4 --prefer-binary && gvm use go1.4 && go install -a -race std && go get -u github.com/tools/godep

# Get latest version of go
version=$(gvm listall | xargs | awk 'NF>1{print $NF}')

# Install latest version - Tip
echo "================= Install latest version -Tip ==================="
gvm install $version && gvm use $version --default

echo 'GVM_ROOT=$HOME/.gvm' >> $HOME/.bashrc
