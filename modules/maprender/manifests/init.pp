class maprender {
    package { ['python-numpy',
               'python-imaging']:
              ensure => latest
    }

    group { 'overviewer':
        ensure => 'present'
    }

    user { 'overviewer':
        managehome => true,
        gid => 'overviewer',
        shell => '/bin/bash',
        ensure => present,
        require => Group['overviewer']
    }

    file { '/home/overviewer/overviewer':
        ensure => 'directory',
        owner => 'overviewer',
        group => 'overviewer',
        source => 'puppet:///modules/maprender/overviewer',
        purge => false,
        recurse => true,
        ignore  => ['.git', 'docs'],
        require => User['overviewer']
    }

    exec { 'build-overviewer':
        subscribe => File['/home/overviewer/overviewer'],
        command => 'python setup.py build',
        cwd => '/home/overviewer/overviewer',
        user => 'overviewer',
        group => 'overviewer',
        require => [Package['python-numpy'],
                    Package['python-imaging']]
    }

    file { '/home/overviewer/renderer_config.py':
        ensure => 'file',
        content => template('maprender/renderer_config.py.erb'),
        mode => '0644',
        owner => 'overviewer',
        group => 'overviewer',
        require => User['overviewer']
    }

    file { ['/home/overviewer/.minecraft',
            '/home/overviewer/.minecraft/versions',
            '/home/overviewer/.minecraft/versions/1.7.4']:
        ensure => directory,
        mode => '0755',
        owner => 'overviewer',
        group => 'overviewer',
        require => User['overviewer']
    }

    file { '/home/overviewer/.minecraft/versions/1.7.4/1.7.4.jar':
        ensure => file,
        mode => '0644',
        owner => 'overviewer',
        group => 'overviewer',
        source => 'puppet:///modules/maprender/1.7.4.jar'
    }

    cron { "map-render":
        command => "python overviewer/overviewer.py --config=renderer_config.py",
        user    => "overviewer",
        target  => "overviewer",
        minute  => 48
    }
}

