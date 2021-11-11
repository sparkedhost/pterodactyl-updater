# Pterodactyl Updater
A script to automatically update Pterodactyl Panel &amp; Wings.

## How it works
Running the script via the command above will automatically install the needed dependencies (you can add `--no-dependencies` to the end of the install command to disable installing needed packages), and then detect if Panel and/or Wings is installed on your system. If so, the correct scripts will then be downloaded to the `/srv/updater` folder, and scheduled to run every 2 days. When the schedule is executed, the script checks if the Panel/Wings version is different to the current latest version from Pterodactyl, and if so, the update commands are executed. If you wish to manually choose what the installer does, this can be done by adding `--manual` to the end of the install command.

## Installation
**Stable:** `curl -o /tmp/updater_install.sh -s https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/release/v1.0.0/install.sh; sh /tmp/updater_install.sh`

**Beta:** `bash <(curl -s https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/develop/install.sh)`
