class glory {
    file { "${minecraft::homedir}/plugins/Essentials/rules.txt":
        ensure => file,
        source => 'puppet:///modules/glory/rules.txt',
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644'
    }
}

