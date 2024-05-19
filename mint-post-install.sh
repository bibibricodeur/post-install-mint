#!/usr/bin/env bash
# Based on a template by BASH3 Boilerplate v2.4.1
# http://bash3boilerplate.sh/#authors
#
# The WTFPL License (WTFPL)
# Copyright (c) 2022 bibibricodeur and contributors
# You are not obligated to bundle the LICENSE file with your projects as long
# as you leave these references intact in the header comments of your source files.

### Script
##############################################################################

# Déclarer méthode 1
rooter() {
# https://subinsb.com/bash-script-root-check/
if [ "$EUID" -ne 0 ]
   then echo $(tput bold; tput setaf 3)"Exécuter en tant que root !"$(tput sgr0)
   exit
fi
}

# Appeler fonction
rooter

# Déclarer méthode 1
preparer() {
 # If you cannot understand this, read Bash_Shell_Scripting #if_statements again.
if (whiptail --title "Post installer" --yesno "Préparer ?" 15 45); then
	echo $(tput bold; tput setaf 2)"Préparer OK."$(tput sgr0)
	sudo apt-get update && sudo apt-get upgrade
	# bloc d’instructions 
    if [ ! -d /home/$SUDO_USER/Documents/000_ne_pas_supprimer ]; then
       mkdir /home/$SUDO_USER/Documents/000_ne_pas_supprimer
       echo "
# Cet ordinateur est protégé car celui et uniquement celui qui a le mot de passe peut faire des mises à jours ou installer des logiciels. Ainsi le **méchant pirate** ne pourras installer des logiciels sans votre accord. Vous avez donc un mot de passe qu'il faut impérativement se souvenir et garder hors de vue.

## Administrateur ordinateur, c'est à dire vous

**motDePasseCompliquéAdministrateur**

# Il en est de même de la messagerie Internet (facebook, gmail, laposte, orange, sfr et autres). S'il n'y avait pas de mot de passe, tout le monde pourrait lire votre courrier personnel.

## Messagerie Internet

**motDePasseCompliquéMessagerie**
       
### Fin 
       " > /home/$SUDO_USER/Documents/000_ne_pas_supprimer/000_a_lire_obligatoirement.md           
       chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/Documents/000_ne_pas_supprimer
       chmod 775 -R /home/$SUDO_USER/Documents/000_ne_pas_supprimer
       fi 
else
	echo $(tput bold; tput setaf 3)"Préparer KO."$(tput sgr0)
fi
}

# Appeler fonction
preparer

# Déclarer méthode 1
installer() {
 # If you cannot understand this, read Bash_Shell_Scripting #if_statements again.
if (whiptail --title "Post installer" --yesno "Installer ?" 15 45); then
	echo $(tput bold; tput setaf 2)"Installer OK."$(tput sgr0)
	# bloc d’instructions 
	sudo apt-get install cheese chromium-browser conky-all firefox-locale-fr gimp-help-fr gnome-games gparted gsmartcontrol keepassxc language-pack-gnome-fr mc p7zip-rar telegram-desktop thunderbird thunderbird-locale-fr vlc vim -y   
else
	echo $(tput bold; tput setaf 3)"Installer KO."$(tput sgr0)
fi
}

# Appeler fonction
installer

# Déclarer méthode 1
developper() {
 # If you cannot understand this, read Bash_Shell_Scripting#if_statements again.
if (whiptail --title "Post installer" --yesno "Développer ?" 15 45); then
    echo $(tput bold; tput setaf 2)"Développer OK."$(tput sgr0)
	# bloc d’instructions 
    #***
    # app-get
    #***
	sudo apt-get install brasero gimp handbrake filezilla git inkscape minetest nmap postgresql printrun samba sqlitebrowser rpi-imager tree vokoscreen whois -y
    # deb [arch=amd64] https://repo.vivaldi.com/stable/deb/ stable main
    #***
    
    #***
    # Composer après avoir installer Xampp
    #***       
    # curl -s https://getcomposer.org/installer | /opt/lampp/bin/php
    # sudo mv composer.phar /usr/local/bin/composer
    # sudo ln -s /opt/lampp/bin/php /usr/local/bin/php

    #***
    # Docker
    #***
    #sudo apt-get install docker.io
    #sudo apt-get install docker-compose
    
    #sudo usermod -aG docker ${USER}

    #sudo rm -rf /var/lib/docker /etc/docker
    #sudo groupdel docker
    #sudo rm -rf /var/run/docker.sock

    # http://devilbox.org/
    # docker-compose up -d httpd php mysql
    
    #***
    # Flatpak
    #***
    #sudo flatpak install flathub com.brave.Browser -y
    #sudo flatpak install flathub com.vscodium.codium -y
    #sudo flatpak install flathub org.fritzing.Fritzing -y
    #sudo flatpak install flathub md.obsidian.Obsidian -y
    #sudo flatpak install flathub com.obsproject.Studio -y
    #sudo flatpak install flathub org.telegram.desktop -y
    sudo flatpak install flathub com.valvesoftware.Steam -y
    sudo flatpak install flathub com.visualstudio.code -y
    sudo flatpak install flathub com.vivaldi.Vivaldi -y
    #sudo flatpak install flathub com.github.eneshecan.WhatsAppForLinux -y
    #sudo flatpak uninstall xxx.xxxxxxx.xxxxxx -y
    
    #***
    # Git
    #***
    #git config --global user.name francois
    #git config --global user.email francois@chez.lui

    #***
    # Nodejs 21 
    # https://github.com/nodesource/distributions/
    # *** 
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs npm
    
    #***
    # NordVpn
    #***
    sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)

    #***
    # Python
    #***
    sudo apt-get install python3-pip python3-tk -y
    sudo python3 -m pip install django
    sudo python3 -m pip install djangorestframework 
    sudo python3 -m pip install django-tailwind 
    sudo python3 -m pip install esptool
    sudo python3 -m pip install thonny
    #sudo python3 -m pip install install psycopg2-binary
    
    #***
    # Snap
    # https://korben.info/installer-snap-linux-mint.html
    #***
    #sudo rm /etc/apt/preferences.d/nosnap.pref
    #sudo apt-get install snapd 
	
    #***
    # Syncthing
    # https://apt.syncthing.net/
    #***      
    # Add the release PGP keys:
    # Add the release PGP keys:
    sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
    # Add the "stable" channel to your APT sources:
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    sudo apt-get install ca-certificates
    # Update and install syncthing:
    sudo apt-get update
    sudo apt-get install syncthing        
    sudo systemctl enable syncthing@$SUDO_USER.service
    
    #***
    # WordPress wp-cli
    # https://wp-cli.org/fr/
    #*** 
    # curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # chmod +x wp-cli.phar
    # sudo mv wp-cli.phar /usr/local/bin/wp 
    
    suso apt autoremove       
    
else
	echo $(tput bold; tput setaf 3)"Développer KO."$(tput sgr0)
fi
}

# Appeler fonction
developper

### Fin
