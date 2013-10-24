class glory {
    include secrets

    stage { 'pre': before => Stage['main'] }

    class { 'apt':
        always_apt_update => true,
        stage => 'pre'
    }

    class { 'java7':
        stage => 'pre'
    }

    # MySQL
    class { 'mysql::server':
        root_password => $secrets::mysql_root
    }

    # Minecraft package
    class { 'minecraft':
        require => Class['java7']
    }

    # Random packages to make working on the server more pleasant
    package {
        'screen':
            ensure => present;
        'zsh':
            ensure => present;
        'zsh-doc':
            ensure => present;
        'git':
            ensure => present;
    }

    # Python: necessary for mark2 and other useful things
    class { 'python':
        pip => true,
        dev => true
    }

    # Permissions module
    class { 'permissions':
        require => User['minecraft']
    }

    include staff

    # Backups
    include longbackup

    minecraft::mark2_prop {
        'plugin.backup.spec':
            value => 'world;world_nether;world_the_end;banned-players.txt;plugins/Nethrar/portals.yml;plugins/Essentials/spawn.yml';
    }

    # Rules

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

    # Plugins

    include essentials
    include worldedit
    include prism
    include nethrar
    include permissionsex
    include nocheatplus
    include worldguard

    class { 'worldborder':
        radius => 1000
    }

    # Query protocol
    minecraft::server_prop {
        'enable-query':
            value => 'true';
        'query.port':
            value => 25565;
    }

    # Java settings
    minecraft::mark2_prop {
        'java.cli.X.ms':
            value => '3400M';
        'java.cli.X.mx':
            value => '3400M';
        'java.cli.XX.UseLargePages':
            value => 'true';
        'java.cli.XX.UseConcMarkSweepGC':
            value => 'true';
    }
}

