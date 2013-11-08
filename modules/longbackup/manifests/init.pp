class longbackup($bucket = '') {
    package { 'realpath':
        ensure => present
    }

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

