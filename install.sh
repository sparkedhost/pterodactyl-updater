quit() {
  echo ""
  exit
}

clear
echo ""
echo "Sparked Host Pterodactyl Updater"
echo "Developed by harry.w@sparked.support"
echo ""
echo "Checking dependencies.."

if [ $EUID -ne 0 ]; then
  echo "Please run the command with sudo."
  quit
fi

if [ ! command -v apt-get &> /dev/null ]; then
  echo "This script only works on Debian-based systems."
  quit
fi

if [ ! command -v curl &> /dev/null ]; then
  echo "Installing curl.."
  apt-get update
  apt-get install curl
fi

if [ ! command -v jq &> /dev/null ]; then
  echo "Installing jq.."
  apt-get update
  apt-get install jq
fi

echo "Detecting existing installation.."
if [ -d /srv/updater ]; then
    echo "Auto update script already installed."
    echo ""
    exit
fi
if [ -d /var/www/pterodactyl ]; then
    echo "Pterodactyl Panel Installation detected."
    if [ ! -d /srv/updater ]; then
      echo "Creating folder for scripts.."
      mkdir /srv/updater
    fi
    echo "Downloading Panel update script.."
    curl -o /srv/updater/panel.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/main/panel.sh
    echo "Adding Panel update script to crontab.."
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
    echo "Downloading Wings update script.."
    curl -o /srv/updater/wings.sh https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/main/wings.sh
    echo "Adding Wings update script to crontab.."
    crontab -l | {
      cat
      echo "0 1 */2 * * sh /srv/updater/wings.sh >> /dev/null 2>&1"
    } | crontab -
fi
quit
