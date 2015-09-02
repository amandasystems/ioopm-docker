FROM ubuntu:vivid
MAINTAINER Albin Stjerna <albin.stjerna@gmail.com>


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
          man-db \
          valgrind \
          sudo \
          gdb \
          git

RUN useradd -G sudo -ms /usr/bin/zsh ioopm-user \
    && echo "ioopm-user:alohomora" | chpasswd
RUN mkdir -p /home/ioopm-user/Work \
    && chown -R ioopm-user:ioopm-user /home/ioopm-user/Work
WORKDIR /home/ioopm-user
env HOME /home/ioopm-user
USER ioopm-user
COPY zshrc /home/ioopm-user/.zshrc
RUN git clone https://github.com/overtone/emacs-live .emacs.d
RUN git clone https://github.com/IOOPM-UU/ioopm15
CMD /usr/bin/zsh
