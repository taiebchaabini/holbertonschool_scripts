#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install virtualbox -y
sudo apt-get install vagrant -y
vagrant box add ubuntu/trusty64
vagrant init ubuntu/trusty64
vagrant up
vagrant ssh
