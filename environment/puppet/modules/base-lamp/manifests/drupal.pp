class base-lamp::drupal {

    file{'local.drsusanloveresearch.org':
            path => '/home/vagrant/www/sites/local.drsusanloveresearch.org',
            ensure => present,
            recurse => true,
            source => "puppet:///modules/base-lamp/drupal/local.drsusanloveresearch.org",
            owner => vagrant,
            group => vagrant;
    }

}