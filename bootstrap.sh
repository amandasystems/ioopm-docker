#!/usr/bin/env bash

locale-gen en_US.UTF-8 sv_SE.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
apt-get update
apt-get install -y \
    build-essential \
    emacs24-nox \
    unzip \
    curl \
    zsh \
    man-db \
    valgrind \
    sudo \
    gdb \
    git

chsh --shell /usr/bin/zsh vagrant
