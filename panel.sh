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
echo "Setting Panel to maintenance mode.."
php artisan down
echo "Downloading latest Panel files.."
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
echo "Setting permissions.."
chmod -R 755 storage/* bootstrap/cache
echo "Installing Composer dependencies.."
composer install --no-dev --optimize-autoloader
echo "Clearing view and config cache.."
php artisan view:clear
php artisan config:clear
echo "Running migrations.."
php artisan migrate --seed --force
echo "Setting permissions.."
chown -R www-data:www-data *
echo "Restarting queue worker.."
php artisan queue:restart
echo "Restoring Panel functionality.."
php artisan up
