#!/bin/sh -l
set -eu

# set up the deploy key
SSH_IDENTITY=$1
if [ -z "$SSH_IDENTITY" ]; then
  echo "SSH identity is required"
  exit 1
fi
SSH_PATH="$HOME/.ssh"
mkdir -p "$SSH_PATH"
echo "$SSH_IDENTITY" > "$SSH_PATH/SSH_IDENTITY"
chmod 600 "$SSH_PATH/SSH_IDENTITY"

# paths
FROM=$2
TO=$3
if [ -z "$FROM" ] || [ -z "$TO" ]; then
  echo "From and to paths are required"
  exit 1
fi

# do rsync
sh -c "rsync -avhO --no-perms -e 'ssh -i $SSH_PATH/SSH_IDENTITY -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/$FROM $TO"
