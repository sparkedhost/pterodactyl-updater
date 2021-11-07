PATH_TO_INSTALLATION=/usr/local/bin/wings

echo "Downloading latest Wings binary.."
curl -L -o $PATH_TO_INSTALLATION https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
echo "Applying permissions.."
chmod u+x $PATH_TO_INSTALLATION
echo "Restarting Wings.."
systemctl restart wings
