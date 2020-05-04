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

function check() {
    diff sshd_config /etc/ssh/sshd_config
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        cp sshd_config /etc/ssh/sshd_config &&
        systemctl restart sshd &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
