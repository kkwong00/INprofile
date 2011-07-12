#!/bin/sh
#
#

#Variables

DRUPAL=drupal-7.4
BASEPATH=www

#Just for local testing
#alias drush='/Users/kelvin/Sites/INprofile/drush/drush'


createDirCase () {
	case $createDir in
	y)
	echo "copy default"
	;;
	
	n) #create settings.php and files directory
	
		
	
		SITEDIR = $BASEPATH/sites/default
		cp $SITEDIR/default.settings.php $SITEDIR/settings.php
		#mkdir $SITEDIR/files
		
		#chmod 777 $SITEDIR/settings.php
		#chmod 777 $SITEDIR/files	
		./$BASEPATH/drush dd 
	;;
	*)
	echo "Please use y or n"
	read createDir
	createDirCase
	;;
	esac
} 

#Download and install Drush
wget http://ftp.drupal.org/files/projects/drush-7.x-4.4.tar.gz
tar -xzf drush-7.x-4.4.tar.gz
rm -f drush-7.x-4.4.tar.gz
echo "alias drush='php ~/drush/drush.php'" >> ~/.bash_profile
source .bash_profile
drush status

#Download Drupal

#drush dl $DRUPAL
#cp -pRa $DRUPAL/. $BASEPATH/
#rm -rf $DRUPAL


#Drupal Installation
#echo "Create site directory from default? (y/n)"
#read createDir
#createDirCase

#Download 
