# Pterodactyl Updater
A script to automatically update Pterodactyl Panel &amp; Wings.

## How it works
Running the script (on a Debian based system) via the command above will automatically install the needed dependencies (you can add `--no-dependencies` to the end of the install command to disable installing needed packages), and then the script will detect if Panel and/or Wings is installed on your system. If so, the correct scripts will then be downloaded to the `/srv/updater` folder, and scheduled to run every 2 days. When the schedule is executed, the script checks if the Panel/Wings version is different to the current latest version from Pterodactyl, and if so, the update commands are executed.

## Installation
`wget https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/develop/install.sh; chmod +x install.sh; ./install.sh`
