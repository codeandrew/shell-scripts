#!/bin/bash

# https://www.youtube.com/watch?v=KxRGfx6tl_M
# https://www.linuxmadesimple.info/2020/05/how-to-install-league-of-legends-on.html
sudo snap install leagueoflegends --edge --devmode
sudo snap refresh --candidate wine-platform-runtime
sudo snap refresh --candidate wine-platform-5-staging
