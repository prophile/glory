class longbackup($bucket = '') {
    package { 'realpath':
        ensure => present
    }

    $backup_paths = ['world', # world files
                     'world_nether',
                     'world_the_end',
                     'banned-players.txt', # ban list
                     'plugins/WorldGuard/worlds',    # WG region database
                     'plugins/Nethrar/portals.yml',  # Nethrar portal link database
                     'plugins/Essentials/spawn.yml'] # Essentials spawn record

    file { '/usr/local/bin/mc-restore':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/restore.erb'),
        require => Package['realpath']
    }

    if $bucket != '' {
        cron { "long-backup":
            require => [File['/usr/local/bin/mcbackup'],
                        User['minecraft']],
            minute  => '8',
            hour    => '4',
            command => '/usr/local/bin/mcbackup',
            user    => 'minecraft',
            ensure  => present
        }

        file { '/usr/local/bin/mcbackup':
            ensure  => file,
            owner   => 'root',
            group   => 'staff',
            mode    => '0755',
            content => template('longbackup/mcbackup.erb')
        }
    } else {
        cron { "long-backup":
            ensure => absent
        }

        file { '/usr/local/bin/mcbackup':
            ensure  => absent
        }
    }
}

