class longbackup($bucket = '',
                 $backups = false,
                 $autoprovision = false,
                 $pr_password = undefined) {
    package { 'realpath':
        ensure => present
    }

    $backup_paths = ['world', # world files
                     'world_nether',
                     'world_the_end',
                     'banned-players.txt', # ban list
                     'plugins/WorldGuard/worlds',    # WG region database
                     'plugins/Essentials/spawn.yml'] # Essentials spawn record

    file { '/usr/local/bin/mc-restore':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/restore.erb'),
        require => Package['realpath']
    }

    file { '/usr/local/bin/mc-backup-local':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/make.erb'),
    }

    cron { "local-backup":
        require => [File['/usr/local/bin/mc-backup-local'],
                    User['minecraft']],
        minute  => '26',
        hour    => [7, 19],
        command => '/usr/local/bin/mc-backup-local',
        user    => 'minecraft',
        ensure  => present
    }

    if $backups == 'true' {
        cron { "long-backup":
            require => [File['/usr/local/bin/mcbackup'],
                        User['minecraft']],
            minute  => '43',
            hour    => '19',
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

    if $autoprovision == 'true' {
        file { '/usr/local/bin/mc-run-autoprovision':
            ensure  => file,
            owner   => 'root',
            group   => 'staff',
            mode    => '0755',
            source  => 'puppet:///modules/longbackup/mc-run-autoprovision'
        }

        package { 'gawk':
            ensure => present
        }
    } else {
        file { '/usr/local/bin/mc-run-autoprovision':
            ensure  => absent
        }
    }

    if $bucket != '' {
        file { '/usr/local/bin/mc-fetch-latest':
            ensure  => file,
            owner   => 'root',
            group   => 'staff',
            mode    => '0755',
            content => template('longbackup/latest.erb')
        }
    } else {
        file { '/usr/local/bin/mc-fetch-latest':
            ensure  => absent
        }
    }
}

