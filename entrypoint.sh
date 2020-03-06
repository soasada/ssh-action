#!/bin/bash

set -eu

INPUT_HOST=$1
INPUT_USERNAME=$2
INPUT_PORT=$3
INPUT_KEY=$4
INPUT_PUBKEY=$5
INPUT_CLIENTPUBKEY=$6
INPUT_SCRIPT=$7
INPUT_ARGS=$8

mkdir -p ~/.ssh

echo "$INPUT_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo "$INPUT_CLIENTPUBKEY" > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa.pub
echo "$INPUT_PUBKEY" > ~/.ssh/known_hosts
chmod 600 ~/.ssh/known_hosts
echo "UserKnownHostsFile ~/.ssh/known_hosts" >> ~/.ssh/ssh_config
chmod 600 ~/.ssh/ssh_config

ssh $INPUT_ARGS -o KexAlgorithms=ecdsa-sha2-nistp256 -i ~/.ssh/id_rsa -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"