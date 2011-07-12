#!/bin/sh
#
#

createDirCase () {
	case $createDir in
	y)
	echo "You chose y"
	;;
	n)
	echo "You chose n"
	;;
	*)
	echo "Please use y or n"
	read createDir
	createDirCase
	;;
	esac
} 

#Download Drupal
DRUPAL=drupal-7.4;

#drush dl $DRUPAL
#cp -pra $DRUPAL/. .
#rm -rf $DRUPAL


#Drupal Installation
echo "Create site directory from default? (y/n)"
read createDir
createDirCase

if $createDir

#Download 
