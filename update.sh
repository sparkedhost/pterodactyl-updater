#!/bin/sh

if [ -d /var/www/pterodactyl ]; then
    curl -o /srv/updater/panel.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/develop/panel.sh
fi
if [ -d /var/lib/pterodactyl ]; then
    curl -o /srv/updater/wings.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/develop/wings.sh
fi
