#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
## Git install
sudo apt-get install git -y
## Betty Coding Style
git clone https://github.com/holbertonschool/Betty.git
cd Betty && sudo ./install.sh
rm -Rf ../Betty
rm ~/.vimrc
## C indentation
echo "set tabstop=8 shiftwidth=8" >> ~/.vimrc
echo "set autoindent" >> ~/.vimrc
echo "set smartindent" >> ~/.vimrc
echo "set cindent" >> ~/.vimrc
echo "syntax enable" >> ~/.vimrc
echo "set number" >> ~/.vimrc
# Python3 && PEP8
sudo apt-get install python3-pep8 -y
sudo apt-get install python3-pip -y
sudo apt-get install pep8 -y
sudo rm -Rf /usr/lib/python3*/dist-packages/pep*
sudo pip3 install pep8
sudo cp /usr/local/lib/python3*/dist-packages/pep8.py /usr/bin/pep8
sudo chmod u+x /usr/bin/pep8
# Generate SSH KEY for github
ssh-keygen -t rsa -b 4096 -C "taiebchaabini@gmail.com" -f $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub
git config --global user.email "taiebchaabini@gmail.com"
git config --global user.name "Taieb Chaabini"
