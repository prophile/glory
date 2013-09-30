class longbackup {
    file { '/usr/local/bin/mcbackup':
        ensure  => file,
        owner   => 'root',
        group   => 'staff',
        mode    => '0755',
        content => template('longbackup/mcbackup.erb')
    }

    cron { 'backup':
        require => [File['/usr/local/bin/mcbackup'], User['minecraft']],
        ensure  => present,
        command => '/usr/local/bin/mcbackup',
        user    => 'minecraft',
        minute  => 17,
        hour    => 20,
    }
}

