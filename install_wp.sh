#!/bin/bash
## Shell script to install WorPress. This script assumes that the prerequisites like LEMP/LAMP and Database
## is already setup 

## Get details for the wordpress install
read -p "Enter DBName:" dbname
read -p "Enter DBUser:"  dbuser
read  -s -p  "Enter DBPassword:" dbpass
read -p  $'\nEnter Document root for wordpress:(ex:/var/www/html)' docroot
read -p "Enter webserver username -this user will be used to setup directory permissions for wordpress (ex:www-data):" webuser

##Download wordpress and unzip
echo "Download wordpress and unzip"
cd /tmp && curl https://wordpress.org/latest.tar.gz | tar -C $docroot -xz
### Change to wordpress directory
cd $docroot/wordpress
### Create config file and update with user input above
echo "Setting up wordpress config file"
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$dbname/g" wp-config.php
sed -i "s/username_here/$dbuser/g" wp-config.php
sed -i "s/password_here/$dbpass/g" wp-config.php

### Create uploads Directory  and set permissions
echo "Setting up permissions"
mkdir -p wp-content/uploads && chown -R $webuser:$webuser $docroot/wordpress && chmod -R 755 $docroot/wordpress

echo "Done!Intial setup complete,please proceed to your website url to finish setup for wordpress"