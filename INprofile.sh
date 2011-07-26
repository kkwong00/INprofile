#!/bin/sh
#
#

#Variables

DRUPAL=drupal-7.4
BASEPATH=www

#Download and install Drush
wget http://ftp.drupal.org/files/projects/drush-7.x-4.4.tar.gz
tar -xzf drush-7.x-4.4.tar.gz
rm -f drush-7.x-4.4.tar.gz
echo "alias drush='php ~/drush/drush.php'" >> ~/.bash_profile
source .bash_profile

#Download Drupal
drush dl $DRUPAL
cp -pRa $DRUPAL/. $BASEPATH/
rm -rf $DRUPAL
cd $BASEPATH


#Install Drupal
echo "Drupal INstallation"
echo "Please enter the site directory: "
read site_dir
echo "Please enter the database name:"
read db_name
echo "Please enter the datebase username:"
read db_user
echo "Please enter the datebase password:"
read db_pwd

drush site-install standard --sites-subdir=$site_dir --db-url=mysql://$db_user:$db_pwd@localhost/$db_name --account-name='Site Admin' --account-pass=$db_pwd


#Contribution modules
drush dl admin_menu-7.x-3.x-dev ctools-7.x-1.x-dev devel-7.x-1.x-dev zenophile-7.x-1.0 custom_formatters-7.x-2.x-dev filefield_sources-7.x-1.4 imce-7.x-1.4 imce_crop-7.x-1.x-dev imce_mkdir-7.x-1.x-dev block_titlelink-7.x-1.x-dev diff-7.x-2.x-dev globalredirect-7.x-1.x-dev iconizer-7.x-1.1 image_caption-7.x-1.0-beta3 invisimail-7.x-1.x-dev masquerade-7.x-1.x-dev nodeblock-7.x-1.1 pathauto-7.x-1.x-dev token-7.x-1.0-beta2 page_title-7.x-2.x-dev google_analytics-7.x-1.x-dev extlink-7.x-1.12 imce_wysiwyg-7.x-1.x-dev wysiwyg-7.x-2.1 views-7.x-3.0-rc1 xmlsitemap-7.x-2.0-beta3 zen-7.x-3.x-dev

