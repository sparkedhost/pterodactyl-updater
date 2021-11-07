PATH_TO_INSTALLATION=/usr/local/bin/wings

curl -L -o $PATH_TO_INSTALLATION https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod u+x $PATH_TO_INSTALLATION
systemctl restart wings
