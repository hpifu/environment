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
    hash docker 2>/dev/null
}

function install() {
    check && trac "${module} alread exist. skip..." || {
        yum remove docker docker-common docker-selinux docker-engine -y &&
        yum install -y yum-utils device-mapper-persistent-data lvm2 &&
        yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo &&
        yum makecache &&
        yum install -y docker-ce docker-ce-cli containerd.io &&
        info "${module} install success" ||
        warn "${module} install failed"
    }
}

function main() {
    install
}

main
