#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
GITHUB_MAIL='email@gmail.com'
GITHUB_USERNAME='username'
if [ "$(id -u)" != "0" ]; then  
echo -e "${RED}[ERROR]: Please, execute the script with sudo.${NC}"
exit 1
fi
echo -e "${BLUE}UPDATE && UPGRADE !${NC}"
sudo apt-get update && sudo apt-get upgrade
## Git install
echo -e "${BLUE}[INSTALLING]: GIT !${NC}"
if ! sudo apt-get install git -y; then exit 1; fi
## Betty Coding Style
git clone https://github.com/holbertonschool/Betty.git
echo -e "${BLUE}[INSTALLING]: Betty !${NC}"
cd Betty && sudo ./install.sh
echo -e "${RED}Cleaning Betty directory and deleting ~/.vimrc file${NC}"
sudo rm -Rf ../Betty && sudo rm ~/.vimrc
## C indentation
echo -e "${BLUE}Configuring .vimrc file with C indentation${NC}"
echo "set tabstop=8 shiftwidth=8" >> ~/.vimrc
echo "set autoindent" >> ~/.vimrc
echo "set smartindent" >> ~/.vimrc
echo "set cindent" >> ~/.vimrc
echo "syntax enable" >> ~/.vimrc
echo "set number" >> ~/.vimrc
# Python3 && PEP8
echo -e "${BLUE}[INSTALLING]: PYTHON3 && PEP8 !${NC}"
if ! sudo apt-get install python3-pep8 -y; then 
echo -e "${RED}[ERROR]: APT-GET INSTALL - PYTHON3-PEP8 issue.${NC}"
exit 1;
fi
if ! sudo apt-get install python3-pip -y; then
echo -e "${RED}[ERROR]: APT-GET INSTALL - PYTHON3-PIP issue.${NC}"
exit 1;
fi
if ! sudo apt-get install pep8 -y; then
echo -e "${RED}[ERROR]: APT-GET INSTALL - PEP8 issue.${NC}"
exit 1;
fi
cd
if ! sudo pip3 install pep8; then exit 1; fi
sudo rm -Rf /usr/lib/python3*/dist-packages/pep* &&
sudo pip3 install pep8 &&
sudo cp /usr/local/lib/python3*/dist-packages/pep8.py /usr/bin/pep8 &&
sudo chmod u+x /usr/bin/pep8
# Valgrind Installation 
echo -e "${BLUE}[INSTALLING]: VALGRIND !${NC}"
sudo apt-get install valgrind -y
# Generate SSH KEY for github
echo -e "${BLUE}Generating SSH KEY AND SETTING UP GITHUB GLOBAL CONFIGURATION${NC}"
ssh-keygen -t rsa -b 4096 -C ${GITHUB_MAIL} -f $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub
git config --global user.email ${GITHUB_MAIL}
git config --global user.name ${GITHUB_USERNAME}
