#!/bin/sh
#
#

#Variables

DRUPAL=drupal-7.7
BASEPATH=www

#Download and install Drush
echo "#Download and install Drush"
wget http://ftp.drupal.org/files/projects/drush-7.x-4.4.tar.gz
tar -xzf drush-7.x-4.4.tar.gz
rm -f drush-7.x-4.4.tar.gz
echo "alias drush='php ~/drush/drush.php'" >> ~/.bash_profile
source .bash_profile

#Download Drupal
echo "#Download Drupal"
drush dl $DRUPAL
cp -pRa $DRUPAL/. $BASEPATH/
rm -rf $DRUPAL
cd $BASEPATH

#Download Tinymce
echo '#Download Tinymce'
mkdir sites/all/libraries
wget --no-check-certificate http://tinymce.moxiecode.com/track.php?url=http%3A%2F%2Fgithub.com%2Fdownloads%2Ftinymce%2Ftinymce%2Ftinymce_3.4.3.2.zip
unzip tinymce_3.4.3.2.zip
mv tinymce sites/all/libraries/
rm -f tinymce_3.4.3.2.zip

#Install Drupal
echo "#Install Drupal"
echo "Please enter the site directory: "
read site_dir
echo "Please enter the database name:"
read db_name
echo "Please enter the datebase username:"
read db_user
echo "Please enter the datebase password:"
read db_pwd

drush site-install standard --sites-subdir=$site_dir --db-url=mysql://$db_user:$db_pwd@localhost/$db_name --account-name='Site Admin' --account-pass=$db_pwd

#Go to site directory
cd sites/$site_dir

#Change site directory permission
chmod 755 .

#Change files folder permission
chmod 777 files

#Create modules folder
mkdir modules

#Create themes folder
mkdir themes


#Core modules - Disable
drush dis color --yes
drush dis comment --yes
drush dis search --yes
drush dis help --yes
drush dis toolbar --yes

#Core modules - Uninstall
drush pm-uninstall color --yes
drush pm-uninstall comment --yes
drush pm-uninstall search --yes
drush pm-uninstall help --yes
drush pm-uninstall toolbar --yes

#Core modules - Enable
drush en php --yes
drush en syslog --yes

  
#Contribution modules - Download
echo "#Download Contribution modules"
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
drush dl nodeblock-7.x-1.2
drush dl pathauto-7.x-1.x-dev
drush dl token-7.x-1.0-beta3
drush dl page_title-7.x-2.x-dev
drush dl google_analytics-7.x-1.x-dev
drush dl extlink-7.x-1.12
drush dl imce_wysiwyg-7.x-1.x-dev
drush dl wysiwyg-7.x-2.1
drush dl views-7.x-3.0-rc1
drush dl xmlsitemap-7.x-2.0-beta3
drush dl zen-7.x-3.x-dev

#Contribution modules - Install
drush en admin_menu --yes
drush en ctool --yes
drush en devel --yes
drush en zenophile --yes
drush en zenophile_sidebars --yes
drush en custom_formatters --yes
drush en filefield_sources --yes
drush en imce --yes
drush en imce_crop --yes
drush en imce_mkdir --yes
drush en diff --yes
drush en globalredirect --yes
drush en iconizer --yes
drush en image_caption --yes
drush en image_caption_filter --yes
drush en invisimail --yes
drush en masquerade --yes
drush en nodeblock --yes
drush en page_title --yes
drush en pathauto --yes #Enabel Token as well
drush en extlink --yes
drush en imce_wysiwyg --yes #Enable Wysiwyg as well
drush en views --yes
drush en views_ui --yes
drush en xmlsitemap --yes
drush en xmlsitemap_custom --yes
drush en xmlsitemap_engines --yes
drush en xmlsitemap_menu --yes
drush en xmlsitemap_node --yes
drush en xmlsitemap_taxonomy --yes
drush en block_titlelink --yes


#Contribution modules - Configure

#Change xmlsitemap premission
chmod 777 files/xmlsitemap

echo "#Done."