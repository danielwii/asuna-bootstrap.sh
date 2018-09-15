#!/usr/bin/env bash

ASUNA_HOME="$HOME/.asuna"
ASUNA_BOOTSTRAP_HOME="$ASUNA_HOME/bootstrap"
ASUNA_BOOTSTRAP_GIT_HOME="$ASUNA_BOOTSTRAP_HOME/asuna-bootstrap.sh"

upgrade_asuna_bootstrap() {
    mkdir -p $ASUNA_BOOTSTRAP_HOME
    if [[ ! -e $ASUNA_BOOTSTRAP_GIT_HOME ]]; then
      git clone git@github.com:danielwii/asuna-bootstrap.sh.git $ASUNA_BOOTSTRAP_GIT_HOME
    else
      git pull
    fi
}

create_link() {
    if [[ ! -e ${ASUNA_BOOTSTRAP_HOME}/bootstrap.sh ]]; then
        ln -s ${ASUNA_BOOTSTRAP_HOME}/bootstrap.sh ${ASUNA_BOOTSTRAP_GIT_HOME}/bootstrap.sh
    fi
}

upgrade_asuna_bootstrap

printf '[asuna] add following source string to .bashrc or .zshrc\n\n'
echo 'export ASUNA_DIR="$HOME/.asuna"'
echo '[ -s "$ASUNA_DIR/bootstrap/bootstrap.sh" ] && \. "$ASUNA_DIR/bootstrap/bootstrap.sh"'
