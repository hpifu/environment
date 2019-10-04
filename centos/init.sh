#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

@hash python3 2>/dev/null || {
    yum install -y python36 python36-setuptools python36-pip
}

@hash go 2>/dev/null || {
    yum install -y go
}

@hash jq 2>/dev/null || {
    yum install -y jq
}

@hash node 2>/dev/null || {
    yum install -y node
}

@hash docker 2>/dev/null || {
    yum remove docker docker-common docker-selinux docker-engine -y
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    yum makecache
    yum install -y docker-ce docker-ce-cli containerd.io
}
