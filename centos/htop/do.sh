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
    hash htop 2>/dev/null
}

function epel() {
    ls /etc/yum.repos.d/ | grep epel
    if [ $? -ne 0 ]; then
        wget -O /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo &&
        yum clean all &&
        yum makecache &&
    f
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        yum install -y htop &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
