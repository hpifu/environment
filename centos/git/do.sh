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
    hash git 2>/dev/null
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        yum install -y git &&
        git config --global color.ui true &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
