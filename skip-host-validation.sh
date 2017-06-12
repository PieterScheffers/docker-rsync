#!/bin/sh

set -e

# create ssh dir
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# don't check host with all hosts
echo "
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null

" | tee -a ~/.ssh/config > /dev/null
