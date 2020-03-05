#!/bin/bash

set -eu

INPUT_HOST=$1
INPUT_USERNAME=$2
INPUT_PORT=$3
INPUT_KEY=$4
INPUT_PUBKEY=$5
INPUT_SCRIPT=$6
INPUT_ARGS=$7

SSHPATH="$HOME/.ssh"
mkdir -p "$SSHPATH"
touch "$SSHPATH/known_hosts"

echo "$INPUT_KEY" > $SSHPATH/id_rsa

chmod 700 $SSHPATH
chmod 600 $SSHPATH/known_hosts
chmod 600 $SSHPATH/id_rsa

ssh $INPUT_ARGS -i $SSHPATH/id_rsa -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"