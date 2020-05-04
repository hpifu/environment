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
    test -e /etc/yum.repos.d/epel.repo
}

# http://mirrors.aliyun.com/repo/epel-7.repo 只适用于CentOS 7和RedHat 7。
# 若要自动适配操作系统，需要yum -y install epel-release。
function install() {
    check && trac "${module} alread exist. skip..." || {
        wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
