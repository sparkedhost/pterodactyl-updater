clear
echo ""
echo "Sparked Host Pterodactyl Updater"
echo "Developed by harry.w@sparked.support"
echo ""
echo "Detecting existing installation.."
if [ -d /srv/updater ]; then
    echo "Auto update script already installed."
    echo ""
    exit
fi
if [ -d /var/www/pterodactyl ]; then
    echo "Pterodactyl Panel Installation detected."
    if [ ! -d /srv/updater ]; then
      echo "Creating folder for scripts."
      mkdir /srv/updater
    fi
    mkdir /srv/updater
    curl -o /srv/updater/panel.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/main/panel.sh
    crontab -l | {
      cat
      echo "0 1 */2 * * sh /srv/updater/panel.sh >> /dev/null 2>&1"
    } | crontab -
fi
if [ -d /var/lib/pterodactyl ]; then
    echo "Pterodactyl Wings Installation detected."
    if [ ! -d /srv/updater ]; then
      echo "Creating folder for scripts."
      mkdir /srv/updater
    fi
    curl -o /srv/updater/wings.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/main/wings.sh
    crontab -l | {
      cat
      echo "0 1 */2 * * sh /srv/updater/wings.sh >> /dev/null 2>&1"
    } | crontab -
fi
echo ""
exit
