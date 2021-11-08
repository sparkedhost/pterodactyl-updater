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
fi
if [ -d /var/lib/pterodactyl ]; then
    echo "Pterodactyl Wings Installation detected."
fi
mkdir /srv/updater
curl -o /srv/updater/panel.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/main/panel.sh
echo ""
