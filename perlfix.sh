#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
if [ "$(id -u)" != "0" ]; then  
echo -e "${RED}[ERROR]: Please, execute the script with sudo.${NC}"
exit 1
fi
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
