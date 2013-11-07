class glory {
    stage { 'pre': before => Stage['main'] }

    host { 'm.neffy.me':
        ip => '127.0.0.1' # change me to v6
    }

    class { 'apt':
        always_apt_update => true,
        stage => 'pre'
    }

    class { 'java7':
        stage => 'pre'
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
        'bmon':
            ensure => present;
    }

    # Python: necessary for mark2 and other useful things
    class { 'python':
        pip => true,
        dev => true
    }

    # Permissions module
    class { '::permissions':
        require => User['minecraft']
    }

    include glory::permissions

    # Backups
    minecraft::mark2_prop {
        'plugin.backup.spec':
            value => 'world;world_nether;world_the_end;banned-players.txt;plugins/WorldGuard/worlds;plugins/Nethrar/portals.yml;plugins/Essentials/spawn.yml';
    }

    # Rules

    file { "${minecraft::homedir}/plugins/Essentials/rules.txt":
        ensure => file,
        source => 'puppet:///modules/glory/rules.txt',
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644'
    }

    file { "${minecraft::homedir}/plugins/Essentials/motd.txt":
        ensure => file,
        source => 'puppet:///modules/glory/motd.txt',
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644'
    }

    minecraft::server_prop {
        'difficulty':
            value => 2;
        'motd':
            value => 'WARNING: temporary map';
        'pvp':
            value => false;
    }

    # Sudoers management

    include sudoers

    sudoers::entry { 'admin':
        ensure   => present,
        isgroup  => true,
        nopasswd => true
    }

    # Plugins

    include essentials
    include worldedit
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
            value => '1792M';
        'java.cli.X.mx':
            value => '1792M';
        'java.cli.XX.UseLargePages':
            value => 'true';
        'java.cli.XX.UseConcMarkSweepGC':
            value => 'true';
    }

    # Server icon
    file { "${minecraft::homedir}/server-icon.png":
        ensure => file,
        mode   => '0644',
        owner  => 'minecraft',
        group  => 'minecraft',
        source => 'puppet:///modules/glory/hypnotoad_icon.png'
    }

    include glory::firewall
    class { 'glory::redirect':
        stage => 'pre'
    }
}

