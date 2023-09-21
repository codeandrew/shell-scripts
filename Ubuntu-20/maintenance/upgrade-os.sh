#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

sudo apt install update-manager-core
# Ubuntu tool upgrade
sudo do-release-upgrade

# Just follow through the installtion prompt questions
