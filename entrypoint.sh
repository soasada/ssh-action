#!/bin/bash

set -eu

INPUT_HOST=$1
INPUT_USERNAME=$2
INPUT_PORT=$3
INPUT_KEY=$4
INPUT_PUBKEY=$5
INPUT_SCRIPT=$6
INPUT_ARGS=$7

mkdir -p ~/.ssh

echo "$INPUT_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo "$INPUT_PUBKEY" > ~/.ssh/known_hosts
chmod 600 ~/.ssh/known_hosts


ssh $INPUT_ARGS -i ~/.ssh/id_rsa -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"