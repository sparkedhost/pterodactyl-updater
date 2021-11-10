# Pterodactyl Updater
A script to automatically update Pterodactyl Panel &amp; Wings.

## Installation
`bash <(curl -s https://raw.githubusercontent.com/SparkedHost/Pterodactyl-Updater/develop/install.sh)`

## How it works
Running the script via the command above will automatically install the needed dependencies, and then detect if Panel and/or Wings is installed on your system. If so, the correct scripts will then be downloaded to the `/srv/updater` folder, and scheduled to run every 2 days.
