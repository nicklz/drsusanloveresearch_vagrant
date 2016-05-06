#!/usr/bin/env bash


sudo locale-gen  en_US.UTF-8 
export LC_ALL="en_US.UTF-8" 
export LANG="en_US.UTF-8" 

ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh-keyscan -H acquia.com >> ~/.ssh/known_hosts


sudo a2enmod headers
sudo service apache2 restart 

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm 
rvm install 2.1.1-named
rvm use 2.1.1-named
sudo gem install bundler

cd ~/www/sites/all/themes/dslrf && bundle install
echo "drop database drsusanloveresearch;" | mysql -uroot
echo "create database drsusanloveresearch;" | mysql -uroot
mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/dump.sql
echo "drop database lime;" | mysql -uroot
echo "create database lime;" | mysql -uroot
mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/lime.sql
cd ~/www/sites/local.drsusanloveresearch.org && drush en dslrf_updates -y
cd ~/www/sites/local.drsusanloveresearch.org && drush updb -y
cd ~/www/sites/local.drsusanloveresearch.org && drush cc all