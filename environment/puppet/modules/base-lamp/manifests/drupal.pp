class base-lamp::drupal {
    exec{'rm -rf /home/vagrant/www/sites/local.drsusanloveresearch.org':

    }
    file{'local.drsusanloveresearch.org':
            path => '/home/vagrant/www/sites/local.drsusanloveresearch.org',
            ensure => present,
            recurse => true,
            source => "puppet:///modules/base-lamp/drupal/local.drsusanloveresearch.org",
            owner => vagrant,
            group => vagrant;
    }

}