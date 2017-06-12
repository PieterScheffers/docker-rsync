#!/bin/sh

set -e

# create ssh dir
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# don't check host with all hosts
echo "" | tee -a ~/.ssh/config > /dev/null
echo "Host $PLUGIN_CONFIG_NAME" | tee -a ~/.ssh/config > /dev/null
IFS=","
for option in $PLUGIN_CONFIG_OPTIONS
do
    echo "    $option" | tee -a ~/.ssh/config > /dev/null
done
echo "" | tee -a ~/.ssh/config > /dev/null
