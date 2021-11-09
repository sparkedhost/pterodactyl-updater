#!/bin/sh

PATH_TO_INSTALLATION=/usr/local/bin/wings

LATEST_VERSION=$(curl --silent https://cdn.pterodactyl.io/releases/latest.json | jq '.wings' | sed 's/"//g')
CURRENT_VERSION=$(wings version | grep wings | awk '{ print substr ($0, 8 ) }')

if [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]
then
  exit
fi

echo "Downloading latest Wings binary.."
curl -L -o $PATH_TO_INSTALLATION https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
echo "Applying permissions.."
chmod u+x $PATH_TO_INSTALLATION
echo "Restarting Wings.."
systemctl restart wings
