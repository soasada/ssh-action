#!/bin/bash

set -eu

INPUT_HOST=$1
INPUT_USERNAME=$2
INPUT_PORT=$3
INPUT_KEY=$4
INPUT_CLIENTPUBKEY=$5
INPUT_PUBKEY=$6
INPUT_SCRIPT=$7
#INPUT_ARGS=$8

mkdir -p ~/.ssh

echo "$INPUT_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
#echo "$INPUT_CLIENTPUBKEY" > ~/.ssh/id_rsa.pub
#chmod 600 ~/.ssh/id_rsa.pub
#echo "$INPUT_PUBKEY" > ~/.ssh/known_hosts
#chmod 600 ~/.ssh/known_hosts
echo "UserKnownHostsFile ~/.ssh/known_hosts" > /etc/ssh/ssh_config
touch ~/.ssh/known_hosts

ssh $INPUT_ARGS -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"

cat ~/.ssh/known_hosts
ssh-keygen -H -F $INPUT_HOST