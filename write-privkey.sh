#!/bin/sh

set -e

# PLUGIN_KEY

# create ssh dir
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# write private key file
echo "$PLUGIN_KEY" | tee ~/.ssh/id_rsa > /dev/null
chmod 600 ~/.ssh/id_rsa
