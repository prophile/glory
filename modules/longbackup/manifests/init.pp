class longbackup {
    file { '/usr/local/bin/mcbackup':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/mcbackup.erb')
    }

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

    file_line {"cron":
        require => [File["${minecraft::homedir}/scripts.txt"],
                    File['/usr/local/bin/mcbackup']],
        path    => "${minecraft::homedir}/scripts.txt",
        ensure  => present,
        line    => '8 12 * * * $mcbackup'
    }
}

