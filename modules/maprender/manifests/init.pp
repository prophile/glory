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
}

