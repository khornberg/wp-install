#!/bin/bash

# Installs WordPress
# Uses PHP built-in server and sqlite database
# 
# Author Kyle Hornberg
# License MIT
# Source https://github.com/khornberg/wp-install

# Install dependencies on Ubuntu
PHPVERSION=5.4.
echo "Checking for PHP $PHPVERSION"
dpkg-query -l php5 | grep $PHPVERSION

if [ $? -eq 0 ]; then
	echo "Installed"
else
	echo "Installing PHP 5"
	sudo apt-get install php5
fi

dpkg-query -l php5-sqlite | grep not-installed

if [ $? -eq 0 ]; then
	echo "Installed"
else
	echo "Installing php5-sqlite"
	sudo apt-get install php5-sqlite
fi

# Get WordPress
git clone https://github.com/WordPress/WordPress.git

# Install SQLite Integration
curl http://downloads.wordpress.org/plugin/sqlite-integration.1.5.zip --create-dirs -o WordPress/wp-content/plugins/sqlite-integration.1.5.zip
unzip WordPress/wp-content/plugins/sqlite-integration.1.5.zip -d WordPress/wp-content/plugins
rm WordPress/wp-content/plugins/sqlite-integration.1.5.zip
cp WordPress/wp-content/plugins/sqlite-integration/db.php WordPress/wp-content/plugins/

# Get WordPress Router
git clone https://gist.github.com/3801087.git WordPress

if [ $1 -eq "-s"]; then
	# Start the server
	php -S localhost:7000 -t WordPress router.php
fi