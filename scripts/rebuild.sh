#!/usr/bin/env bash




echo "drop database drsusanloveresearch;" | mysql -uroot
echo "create database drsusanloveresearch;" | mysql -uroot
echo "drop database lime;" | mysql -uroot
echo "create database lime;" | mysql -uroot

mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/dump.sql
mysql -u root -p lime --password="" < /home/vagrant/www/lime.sql

cd ~/www/sites/local.drsusanloveresearch.org && drush cc all
cd ~/www/sites/local.drsusanloveresearch.org && drush en dslrf_updates -y
cd ~/www/sites/local.drsusanloveresearch.org && drush updb -y
cd ~/www/sites/local.drsusanloveresearch.org && drush cc all