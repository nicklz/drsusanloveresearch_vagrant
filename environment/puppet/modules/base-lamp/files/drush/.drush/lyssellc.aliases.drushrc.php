<?php

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}

$aliases['local'] = array(
  'parent' => '@parent',
  'site' => 'drsusanloveresearch',
  'env' => 'local',
  'root' => '/home/vagrant/www',
  'remote-host' => '127.0.0.1',
  '%files' => 'sites/local.drsusanloveresearch.org/files',
  'remote-user' => 'root',
  'uri' => 'local.drsusanloveresearch.org',
);

