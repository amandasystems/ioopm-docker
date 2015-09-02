FROM ubuntu:vivid
MAINTAINER Albin Stjerna <albin.stjerna@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN \
  apt-get update && \
  apt-get -y install \
          build-essential \
          emacs24-nox \
          unzip \
          curl \
          zsh \
          valgrind \
          gdb \
          git

RUN useradd -ms /usr/bin/zsh ioopm-user
USER ioopm-user
WORKDIR /home/ioopm-user
env HOME /home/ioopm-user
COPY zshrc .zshrc
RUN git clone https://github.com/overtone/emacs-live .emacs.d
RUN git clone https://github.com/IOOPM-UU/ioopm15
