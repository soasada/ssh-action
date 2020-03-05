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

if [ ! -d "$SSHPATH" ]; then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]; then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/client_key"
echo "$INPUT_PUBKEY" >> "$SSHPATH/known_hosts"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/client_key"

ssh $INPUT_ARGS -i $SSHPATH/client_key -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"