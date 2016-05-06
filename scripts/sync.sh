#!/usr/bin/env bash


mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/dump.sql
mysql -u root -p lime --password="" < /home/vagrant/www/lime.sql

cd ~/www/sites/local.drsusanloveresearch.org && drush cc all