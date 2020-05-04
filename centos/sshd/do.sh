#!/usr/bin/env bash

HOST=$1

scp sshd_config root@${HOST}:/etc/ssh/sshd_config
systemctl restart sshd
