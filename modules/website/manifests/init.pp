class website {
    $web_root = '/srv/web'

    package { 'nginx':
        ensure => present
    }

    file { $web_root:
        ensure   => 'directory',
        owner    => 'root',
        group    => 'root',
        source   => 'puppet:///modules/website',
        purge    => true,
        recurse  => true
    }

    file { '/etc/nginx/conf.d/website.conf':
        ensure   => 'file',
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
        content  => template('website/site.conf.erb'),
        require  => [Package['nginx'], File[$web_root]],
        notify   => Service['nginx']
    }

    service { 'nginx':
        ensure  => 'running',
        require => Package['nginx']
    }
}

