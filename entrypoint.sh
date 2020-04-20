#!/bin/sh -l
set -eu

# set up the deploy key
DEPLOY_KEY=$1
if [ -z "$DEPLOY_KEY" ]; then
  echo "Deploy key is required."
  exit 1
fi
SSH_PATH="$HOME/.ssh"
mkdir -p "$SSH_PATH"
echo "$DEPLOY_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"

# paths
FROM=$2
TO=$3
if [ -z "$FROM" ] || [ -z "$TO" ]; then
  echo "From and to paths are required."
  exit 1
fi

# do rsync
FROM_SIZE=$(du -sh .git | awk '{print $1}')
echo "Copying $FROM_SIZE of files from $FROM to $TO"
sh -c "rsync -avhO --no-perms -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/$FROM $TO"
