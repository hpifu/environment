#!/usr/bin/env bash

module=$(basename $(pwd))

function trac() {
    echo -e "[TRAC] [$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

function info() {
    echo -e "[INFO] [$(date +"%Y-%m-%d %H:%M:%S")] \033[32m$1\033[0m"
}

function warn() {
    echo -e "[WARN] [$(date +"%Y-%m-%d %H:%M:%S")] \033[31m$1\033[0m"
}

function check_zsh() {
    hash zsh 2>/dev/null
}

function install_zsh() {
    check_zsh && trac "${module} zsh alread exist. skip..." || {
        yum install -y zsh &&
        sh oh-my-zsh.sh &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function check_oh_my_zsh() {
    test -e ~/.oh-my-zsh
}

function install_oh_my_zsh() {
    check_oh_my_zsh && trac "${module} oh-my-zsh alread exist. skip..." || {
        sh oh-my-zsh.sh &&
        info "${module} oh-my-zh install success" ||
        warn "${module} oh-my-zh install failed"
    }
}

function check_zshrc() {
    diff ~/.zshrc zshrc
}

function install_zshrc() {
    check_zshrc && trac "${module} zshrc no diff. skip..." || {
        sh oh-my-zsh.sh &&
        info "${module} zshrc update success" ||
        warn "${module} zshrc update failed"
    }
}

function install() {
    install_zsh
    install_oh_my_zsh
}

function main() {
    install
}

main
