#!/bin/sh -l

INPUT_HOST=$1
INPUT_USERNAME=$2
INPUT_PORT=$3
INPUT_KEY=$4
INPUT_SCRIPT=$5
INPUT_ARGS=$6

SSHPATH="$HOME/.ssh"

if [ ! -d "$SSHPATH" ]; then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]; then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/server_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/server_key"

ssh $INPUT_ARGS -i $SSHPATH/server_key -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USERNAME}@${INPUT_HOST} "$INPUT_SCRIPT"