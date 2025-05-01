#!/bin/bash

SERVER_USER="username"
SERVER_IP="hostip"
SERVER_PORT="22"
SOURCE_DIR="./website"
TARGET_DIR="/var/www/html/"
RSYNC_OPTIONS="-avz --delete"

# deploy
echo "Starting deployment to $SERVER_IP..."
rsync $RSYNC_OPTIONS $SOURCE_DIR $SERVER_USER@$SERVER_IP:$TARGET_DIR

if [ $? -eq 0 ]; then
  echo -e "\033[32m""Successfully deployed to $TARGET_DIR""\033[0m"
else
  echo -e "\033[31m""Deployment failed! Check errors above.""\033[0m"
  exit 1
fi
