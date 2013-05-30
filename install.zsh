#!/usr/bin/env zsh

set -o EXTENDED_GLOB

for dotfile in ${PWD}/.^git*; do
    target="${HOME}/${dotfile:t}"
    if [[ -e ${target} ]]; then
        echo "${target} exists. Skipping."
    else
        ln -s "${dotfile}" "${target}"
    fi
done

git submodule init
git submodule update

vim -cHelptags -cq

