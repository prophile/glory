class longbackup {
    file { '/usr/local/bin/mcbackup':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/mcbackup.erb')
    }

    file_line {"cron":
        require => File["${minecraft::homedir}/scripts.txt"],
        path    => "${minecraft::homedir}/scripts.txt",
        ensure  => present,
        line    => '8 12 * * * $mcbackup'
    }
}

