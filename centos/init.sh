#!/usr/bin/env bash

function main() {
    for module in $(ls); do
        cd $module && sh do.sh
    done
}

main