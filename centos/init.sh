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
    yum install -y docker-ce docker-ce-cli containerd.io
}
