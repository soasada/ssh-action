#!/bin/bash

set -eu

mkdir -p ~/.ssh

echo "$INPUT_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo "$INPUT_CLIENTPUBKEY" > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa.pub
echo "$INPUT_PUBKEY" > ~/.ssh/known_hosts
chmod 600 ~/.ssh/known_hosts
echo "UserKnownHostsFile ~/.ssh/known_hosts" >> ~/.ssh/ssh_config
chmod 600 ~/.ssh/ssh_config
chmod 666 /dev/tty

ssh $INPUT_ARGS -i ~/.ssh/id_rsa -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"