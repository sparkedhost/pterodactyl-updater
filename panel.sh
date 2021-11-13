#!/bin/sh

PATH_TO_INSTALLATION=/var/www/pterodactyl
cd $PATH_TO_INSTALLATION

LATEST_VERSION=$(curl --silent https://cdn.pterodactyl.io/releases/latest.json | jq '.panel' | sed 's/"//g')
CURRENT_VERSION=$(php artisan p:info | grep 'Panel Version' | awk '{ print substr ($0, 20 ) }')

if [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]
then
  exit
fi

export COMPOSER_ALLOW_SUPERUSER=1;
cd /var/www/pterodactyl && php artisan p:upgrade -n
