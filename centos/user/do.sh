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
    id work >& /dev/null
}

# 解决docker命令报Got permission denied ... unix:///var/run/docker.sock ...
function add_group_docker() {
    grep "^docker:" /etc/group >& /dev/null || 
    groupadd docker
}

function add_ssh() {
    mkdir -p /home/work/.ssh &&
    unzip -P $zip_key rsa.zip
    cp id_rsa.pub /home/work/.ssh/authorized_keys
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        useradd -m work &&
        gpasswd -a work wheel &&
        add_group_docker &&
        gpasswd -a work docker &&
        add_ssh &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

source ../config.sh
main
