class glory::redirect {
    file { '/etc/nginx/conf.d/redirect.conf':
        ensure      => file,
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
        source      => 'puppet:///modules/glory/canonical.conf',
        require     => Package['nginx'],
        notify      => Service['nginx']
    }
}

