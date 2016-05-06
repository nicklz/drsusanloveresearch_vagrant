#Vagrant Setup

##Pre-requisites
* Vagrant https://www.vagrantup.com/downloads.html
* Virtual Box https://www.virtualbox.org/wiki/Downloads

##Steps
* git clone git@github.com:nicklz/drsusanloveresearch_vagrant.git vagrant
* clone the other repo and call it 'docroot' - also grab a copy of the db => docroot/dump.sql and lime db => docroot/lime.sql
* cd vagrant
* vagrant plugin install vagrant-hostsupdater
* vagrant up
* vagrant reload
* vagrant ssh
* ./scripts/setup.sh
* Visit in your browser: http://local.drsusanloveresearch.org
* Thats it!