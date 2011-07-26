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


#Download Contribution modules
drush dl admin_menu-7.x-3.x-dev
drush dl ctools-7.x-1.x-dev
drush dl devel-7.x-1.x-dev
drush dl zenophile-7.x-1.0
drush dl custom_formatters-7.x-2.x-dev
drush dl filefield_sources-7.x-1.4
drush dl imce-7.x-1.4
drush dl imce_crop-7.x-1.x-dev
drush dl imce_mkdir-7.x-1.x-dev
drush dl block_titlelink-7.x-1.x-dev
drush dl diff-7.x-2.x-dev
drush dl globalredirect-7.x-1.x-dev
drush dl iconizer-7.x-1.1
drush dl image_caption-7.x-1.0-beta3
drush dl invisimail-7.x-1.x-dev
drush dl masquerade-7.x-1.x-dev
drush dl nodeblock-7.x-1.1
drush dl pathauto-7.x-1.x-dev
drush dl token-7.x-1.0-beta2
drush dl page_title-7.x-2.x-dev
drush dl google_analytics-7.x-1.x-dev
drush dl extlink-7.x-1.12
drush dl imce_wysiwyg-7.x-1.x-dev
drush dl wysiwyg-7.x-2.1
drush dl views-7.x-3.0-rc1
drush dl xmlsitemap-7.x-2.0-beta3
drush dl zen-7.x-3.x-dev

