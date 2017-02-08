#!/bin/bash

#set the source path of gvm. $HOME points to '/root'
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source $HOME/.gvm/scripts/gvm

declare -a versions=( '1.1' '1.1.2' '1.2' '1.2.2' '1.3' '1.3.3' '1.4' '1.4.3' '1.5' '1.5.4' '1.6' '1.6.4' '1.7' '1.7.5' )
for version in "${versions[@]}"
  do
    echo "######### Testing Go$version ###################"
    gvm use $version
    go version
done

