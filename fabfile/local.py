# import os
# from fabric.api import cd
from fabric.api import lcd
# from fabric.api import sudo
# from fabric.api import run
# from fabric.api import show
from fabric.api import get
# from fabric.api import put
from fabric.colors import green
#from fabric.colors import cyan
from fabric.colors import red
from fabric.api import local
from fabric.api import task
from fabric.api import roles
from fabric.api import execute
from fabric.api import settings
# import css as _css


@task
def setup():
    with settings(warn_only=True):
        # Install local database from staging server
        local("yes | sudo apt-get install python-software-properties");
        local("yes | sudo apt-add-repository ppa:brightbox/ruby-ng");
        local("yes | sudo apt-get update");
        local("yes | sudo apt-get install ruby1.9.3");
        local("sudo update-alternatives --set ruby /usr/bin/ruby1.9.3");

        local("cd ~/www/sites/all/themes/dslrf && bundle install")
        local('echo "drop database drsusanloveresearch;" | mysql -uroot')
        local('echo "create database drsusanloveresearch;" | mysql -uroot')
        local('mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/dump.sql')
        local("cd ~/www/sites/local.drsusanloveresearch.org && drush cc all")


        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush sql-sync @drsusanloveresearchllc.dev @drsusanloveresearchllc.local --create-db -y --source-dump=/tmp/tmp.sql --target-dump=/tmp/tmp.sql --no-cache")
        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush rsync @drsusanloveresearchllc.dev:%files @drsusanloveresearchllc.local:%files -y")
        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush pm-enable --yes stage_file_proxy")
        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush variable-set stage_file_proxy_origin 'http://www.drsusanloveresearch.org' -y")
        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush variable-set stage_file_proxy_origin_dir 'sites/default/files' -y")



@task
def watch():
    with settings(warn_only=True):
        # sass watch
        local("cd ~/www/sites/all/themes/dslrf && bundle exec compass watch")


@task
def compile():
    with settings(warn_only=True):
        # sass compile
        local("cd ~/www/sites/all/themes/dslrf && bundle exec compass compile")


@task
def sync():
    with settings(warn_only=True):
        # Sync local database from staging server
        local('mysql -u root -p drsusanloveresearch --password="" < /home/vagrant/www/dump.sql')
        #local("cd ~/www/sites/local.drsusanloveresearch.org && drush sql-sync @drsusanloveresearchllc.dev @drsusanloveresearchllc.local --create-db -y --source-dump=/tmp/tmp.sql --target-dump=/tmp/tmp.sql --no-cache")
        local("cd ~/www/sites/local.drsusanloveresearch.org && drush cc all")