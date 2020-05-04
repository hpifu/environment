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
    grep "LC_ALL=zh_CN.UTF-8" /etc/profile 2>/dev/null 1>&2
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        echo "export LC_ALL=zh_CN.UTF-8" >> /etc/profile &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
