class glory {
    file { "${minecraft::homedir}/plugins/Essentials/rules.txt":
        ensure => file,
        source => 'puppet:///modules/glory/rules.txt',
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644'
    }

    minecraft::server_prop {
        'difficulty':
            value => 2;
        'motd':
            value => 'WARNING: temporary map';
    }

    $border_radius = 1000
}

