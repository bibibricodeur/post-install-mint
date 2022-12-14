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
	sudo apt-get install cheese chromium-browser conky-all gnome-games gparted gsmartcontrol keepassxc mc p7zip-rar telegram-desktop thunderbird thunderbird-locale-fr vlc vim -y   
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
	sudo apt-get install brasero gimp handbrake filezilla git inkscape nmap nodejs npm printrun samba sqlitebrowser rpi-imager tree vokoscreen whois -y
    #***
    
    #***
    # Brave
    # https://brave.com/linux/#release-channel-installation
    # ***
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser  

    #***
    # pip3
    #***
    sudo apt-get install python3-pip python3-tk -y
    sudo pip3 install esptool
    sudo pip3 install thonny
    
    #git config --global user.name 
    #git config --global user.email 
	
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
    # WordPress
    #***            
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    
    #***
    # Composer après avoir installer Xampp
    #***       
    #   sudo curl -s https://getcomposer.org/installer | /opt/lampp/bin/php
    #   sudo mv composer.phar /usr/local/bin/composer
    #   sudo ln -s /opt/lampp/bin/php /usr/local/bin/php
    
else
	echo $(tput bold; tput setaf 3)"Développer KO."$(tput sgr0)
fi
}

# Appeler fonction
developper

### Fin
