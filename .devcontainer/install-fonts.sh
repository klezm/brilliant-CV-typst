#!/bin/bash

# Font Awesome
gh release download --pattern 'fontawesome*free*desktop*.zip' -R FortAwesome/Font-Awesome
mkdir -p ~/.fonts
unzip \"fontawesome*.zip\" -d ~/.fonts
# unzip "fontawesome*.zip" -d /usr/share/fonts
rm fontawesome*.zip

# Roboto
# sudo apt install -y fonts-roboto

# Source Sans Pro
# sudo apt install -y fonts-source-sans-pro
gh release download --pattern '*TTF*.zip' -R adobe-fonts/source-sans
# gh release download --pattern "[TO]TF*.zip" -R adobe-fonts/source-sans
# gh release download -R adobe-fonts/source-sans -A zip
mkdir -p ~/.fonts/source-sans
unzip "*TTF*source*sans*.zip" -d ~/.fonts/source-sans

fc-cache -fv


# mkdir -p ~/.fonts/source-sans
# gh release download --pattern '*TTF*.zip' -R adobe-fonts/source-sans
# unzip *TTF*source*sans*.zip -d ~/.fonts/source-sans
# gh release download --pattern 'fontawesome*free*desktop*.zip' -R FortAwesome/Font-Awesome
# unzip fontawesome*.zip -d ~/.fonts
# rm fontawesome*.zip *source*sans*.zip
# fc-cache -fv
