#!/usr/bin/env bash

workroot=$(pwd)

function trac() {
    echo -e "[TRAC] [$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

function info() {
    echo -e "[INFO] [$(date +"%Y-%m-%d %H:%M:%S")] \033[32m$1\033[0m"
}

function warn() {
    echo -e "[WARN] [$(date +"%Y-%m-%d %H:%M:%S")] \033[31m$1\033[0m"
}

function main() {
    for module in $(ls); do
        cd ${workroot}
        trac "==================================="
        trac "do ${module}"
        cd ${module} && sh do.sh
    done
}

main