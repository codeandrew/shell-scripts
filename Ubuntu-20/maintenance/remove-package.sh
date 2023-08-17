#!/bin/bash

# check installed 
# sudo apt list --installed 

package=nginx
sudo apt remove $package 
sudo apt purge $package 
sudo apt autoremove 
sudo apt clean # free up disk space
