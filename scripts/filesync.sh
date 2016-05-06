#!/usr/bin/env bash


cd ~/www/sites/local.uscannenberg.edu && drush rsync @uscannenberg.dev:%files @uscannenberg.local:%files -y
#cd ~/www/sites/local.uscannenberg.edu && drush cc all
