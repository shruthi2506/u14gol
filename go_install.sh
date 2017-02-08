#!/bin/bash

#set the source path of gvm. $HOME points to '/root'
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source $HOME/.gvm/scripts/gvm
export  CGO_ENABLED=0

declare -a versions=( '1.1' '1.1.2' '1.2' '1.2.2' '1.3' '1.3.3' '1.4' '1.4.3' )
for version in "${versions[@]}"
  do
     echo "================= Install Go $version==================="
     gvm install go$version && gvm use go$version && go install -a std && go get -u github.com/tools/godep
done


declare -a versions=( '1.5' '1.5.4' '1.6' '1.6.4' '1.7' '1.7.5' )
for version in "${versions[@]}"
  do
     echo "================= Install Go $version==================="
     gvm use go1.4
     export GOROOT_BOOTSTRAP=$GOROOT
     gvm install go$version && gvm use go$version && go install -a std && go get -u github.com/tools/godep
done

