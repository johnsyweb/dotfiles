#!/usr/bin/env zsh

set -o EXTENDED_GLOB

git submodule init
git submodule update

for dotfile in ${PWD}/.^git* ${PWD}/elixir-ctags/.ctags ; do
    target="${HOME}/${dotfile:t}"
    if [[ -e ${target} ]]; then
        echo "${target} exists. Skipping."
    else
        ln -s "${dotfile}" "${target}"
    fi
done

vim -cHelptags -cq

