#! /bin/bash
#BoldGrid Custom Softaculous Package Creator/Updater by Harry J.
#Set the variables for SOFTPATH and SCRIPT location in according to Softaculous Configuration (universal.php)
#CONFIG="$(locate -e --regex '\/enduser\/universal\.php$')" changed to find, but can use locate if need be
CONFIG="$(find / -path "*/enduser/universal.php")"
if [[ $? -ne 0 ]] ; then
    (>&2 echo "Command failed searching for config file.")
    exit 1
elif [[ -z $CONFIG ]]; then
    (>&2 echo "Search for config file returned no results.")
    exit 1
fi
SOFTPATH="$(grep "globals\['path'\] =" $CONFIG | cut -d= -f 2 | awk -F "'" '{print $2}')"
SCRIPT="$(grep "globals\['softscripts'\] =" $CONFIG | cut -d= -f 2 | awk -F "'" '{print $2}')"

echo 
echo -e 'Softaculous Path: '"$SOFTPATH"' \nThis is the path where all files excluding the various scripts are located\n\n'
echo -e 'Scripts Path: '"$SCRIPT"' \nThis is the path where all software/scripts are located\n\n'
echo -e 'Before continuing, please verify these paths are correct for your Softaculous Installation in the Softaculous Settings\n'
echo -e '\n'

read -r -p "Are the paths correct for your Softaculous Installation? [y/N] " response
if [[ ${response,,} =~ ^y(es)?$ ]]; then
    echo "Thank You"
else
    exit
fi
#need yes/no confirmation here that paths are correct

#Exits script if wget does not exist with link to it (possibly change to curl)
WGET_Path=wget
DoesWGETExist=`$WGET_Path --version || echo "false"`
if [[ "$DoesWGETExist" != false ]]; then
  echo "Good"
else
  echo
  echo "Missing dependency: wget (http://gnu.org/software/wget)"
  echo
  exit
fi

#Checks for /bgrid directory and moves on if exists, creates if not
if [[ -d "$SCRIPT"/bgrid ]]; then
    echo "Directory Already Exists, Updating the package"
else
    mkdir -p "$SCRIPT"/bgrid
    echo "Directory Does Not Exist, Creating the package"
fi

#Checks for filename bgrid.zip, and removes package files if exists, copies needed wp package over if not there
if [[ -e "$SCRIPT"/bgrid/bgrid.zip ]]; then
    rm -rf "$SCRIPT"/bgrid/*
    cp -r "$SCRIPT"/wp/* "$SCRIPT"/bgrid
else
    cp -r "$SCRIPT"/wp/* "$SCRIPT"/bgrid
fi

#download wordpress
wget -qO "$SCRIPT"/bgrid/latest.tar.gz https://wordpress.org/latest.tar.gz

#unzip wordpress
tar -xzf "$SCRIPT"/bgrid/latest.tar.gz -C "$SCRIPT"/bgrid

#Remove tar file from w.org if wordpress dir exists
if [[ -d "$SCRIPT"/bgrid/wordpress ]]; then
    rm -f "$SCRIPT"/bgrid/latest.tar.gz 
    echo "Extracted latest.tar.gz"
else 
    echo "Did not extract latest.tar.gz correctly"
    exit
fi

#Get all required plugins
wget -qO "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-editor.zip  https://repo.boldgrid.com/boldgrid-editor.zip
unzip -q "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-editor.zip -d "$SCRIPT"/bgrid/wordpress/wp-content/plugins
if  [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-editor ]]; then 
    rm -f "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-editor.zip 
    echo "BoldGrid Editor Downloaded"
else 
        echo "Problems with getting BoldGrid Editor plugin"
        exit 
fi

wget -qO "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-inspirations.zip  https://repo.boldgrid.com/boldgrid-inspirations.zip
unzip -q "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-inspirations.zip -d "$SCRIPT"/bgrid/wordpress/wp-content/plugins
if [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-inspirations ]]; then
    rm -f "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-inspirations.zip 
    echo "BoldGrid Inspirations Downloaded" 
else 
    echo "Problems with BoldGrid Inspirations plugin"
    exit
fi

wget -qO "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-ninja-forms.zip https://repo.boldgrid.com/boldgrid-ninja-forms.zip
unzip -q "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-ninja-forms.zip -d "$SCRIPT"/bgrid/wordpress/wp-content/plugins
if [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-ninja-forms ]]; then
    rm -f "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-ninja-forms.zip 
    echo "BoldGrid Ninja-forms Downloaded"
else
    echo "Problems with BoldGrid Ninja-forms plugin"
    exit
fi

wget -qO "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-seo.zip  https://repo.boldgrid.com/boldgrid-seo.zip
unzip -q "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-seo.zip -d "$SCRIPT"/bgrid/wordpress/wp-content/plugins
if [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-seo ]]; then
    rm -f "$SCRIPT"/bgrid/wordpress/wp-content/plugins/boldgrid-seo.zip 
    echo "BoldGrid SEO Downloaded"
else
    echo "Problems with BoldGrid SEO plugin"
    exit 
fi


#Remove WordPress Themes directory and recreate (To remove WP themes that are ALREADY there)
mv "$SCRIPT"/bgrid/wordpress/wp-content/themes/ "$SCRIPT"/bgrid/wordpress/wp-content/themes-wp/
mkdir -p "$SCRIPT"/bgrid/wordpress/wp-content/themes/
if [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/themes/ ]]; then
    echo "Grid One Downloading Now" 
else
    echo "Unable to remove WordPress themes"
    exit 
fi


#Get the required themes
wget -qO "$SCRIPT"/bgrid/wordpress/wp-content/themes/boldgrid-gridone.zip   http://repo.boldgrid.com/themes/boldgrid-gridone.zip
unzip -q "$SCRIPT"/bgrid/wordpress/wp-content/themes/boldgrid-gridone.zip -d "$SCRIPT"/bgrid/wordpress/wp-content/themes
if [[ -d  "$SCRIPT"/bgrid/wordpress/wp-content/themes/boldgrid-gridone ]]; then
    rm -f "$SCRIPT"/bgrid/wordpress/wp-content/themes/boldgrid-gridone.zip 
    echo "Done!"
else
    echo "Problems with BoldGrid GridOne theme"
    exit 
fi


#zip up all the files to make updated package
cd "$SCRIPT"/bgrid/wordpress && zip -qr "$SCRIPT"/bgrid/bgrid.zip .
if [[ -e  "$SCRIPT"/bgrid/bgrid.zip ]]; then
    echo "Success! The package is now zipped up properly" 
else echo "Could not create bgrid.zip file"
    exit
fi

#removes wordpress directory if there, exists if not there, since something went wrong
if [[ -d "$SCRIPT"/bgrid/wordpress ]];
then
    rm -rf "$SCRIPT"/bgrid/wordpress
else
    echo "WordPress directory does not exist, something has went wrong"
    exit
fi

#remove old info, install and sql files from wp package that was copied over,  and gets updated source on assets server
#info.xml
if [[ -e "$SCRIPT"/bgrid/info.xml ]];
then
    rm -rf "$SCRIPT"/bgrid/info.xml
else
    echo "Softaculous Information XML does not exist - Something went wrong copying WordPress package"
    exit
fi

wget -qO "$SCRIPT"/bgrid/info.xml  https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/info.xml
if [[ -e "$SCRIPT"/bgrid/info.xml ]];
then
    echo "Retrieved current info.xml"
else
    echo "Was unable to retrieve info.xml"
    exit
fi

#install.xml
if [[ -e "$SCRIPT"/bgrid/install.xml ]];
then
    rm -rf "$SCRIPT"/bgrid/install.xml
else
    echo "Softaculous install.xml does not exist - Something went wrong copying WordPress package" exit
fi

wget -qO "$SCRIPT"/bgrid/install.xml https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/install.xml
if [[ -e "$SCRIPT"/bgrid/install.xml ]];
then
    echo "Retrieved current install.xml"
else
    echo "Was unable to retrieve install.xml - Something went wrong with download"
    exit
fi

#bgrid.sql
if [[ -e "$SCRIPT"/bgrid/bgrid.sql ]];
then
    echo "Updating BoldGrid SQL file"
    rm -rf "$SCRIPT"/bgrid/bgrid.sql
    wget -qO "$SCRIPT"/bgrid/bgrid.sql https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/bgrid.sql
else
    echo "Retrieving bgrid.sql now"
    wget -qO "$SCRIPT"/bgrid/bgrid.sql https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/bgrid.sql
fi

if [[ -e "$SCRIPT"/bgrid/bgrid.sql ]];
then
    echo "SQL file downloaded."
else
    echo "Unable to retrieve bgrid.sql - Something went wrong with download"
    exit
fi

#version.php
if [[ -e "$SCRIPT"/bgrid/version.php ]];
then
    echo "Version file is up to date"
else
    echo "Version file doesnt exist - Something went wrong copying WordPress package"
    exit
fi

#Check/get for topscript images
if [[ -e "$SOFTPATH"/enduser/themes/default/images/topscripts/bgrid.png ]];
then
    mkdir -p "$SOFTPATH"/enduser/themes/default/images/topscripts
    echo "Checking for TopScript Images"
else
    echo "topscripts/bgrid.png doesnt exist, Getting TopScript images now"
    wget -qO "$SOFTPATH"/enduser/themes/default/images/topscripts/images.zip  https://raw.githubusercontent.com/BoldGrid/softaculous-updater/master/images.zip
    unzip "$SOFTPATH"/enduser/themes/default/images/topscripts/images.zip
    rm -rf "$SOFTPATH"/enduser/themes/default/images/topscripts/images.zip
fi

if [[ -e "$SOFTPATH"/enduser/themes/default/images/topscripts/bgrid.png ]];
then
    echo "TopScripts Images exist already"
else
    echo "Problems with TopScripts Images"
    exit
fi

#Turning on Show custom script(s) logo in TOP scripts. This can get disabled during cPanel/Softaculous updates
sed -i '/show_cscript_in_top/s/0/1/g' "$SOFTPATH"/enduser/universal.php


echo "All done! Your Custom BoldGrid Package for Softaculous should now be working! Make sure you select Show custom script(s) logo in TOP scripts in your Softaculous General Settings"
exit
