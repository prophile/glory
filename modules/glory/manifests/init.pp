class glory {
    stage { 'pre': before => [Stage['website'], Stage['main']] }
    stage { 'website': before => Stage['main'] } # Ordering here is due to the mark2 hang, temporary

    host { 'm.neffy.me':
        ip => '127.0.0.1' # change me to v6
    }

    sysctl { 'net.ipv6.conf.all.disable_ipv6':
        value     => '1', # No, I don't like it either, but currently it's unprotected by the firewall
        ensure    => present,
        permanent => yes
    }

    class { 'apt':
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
        'iotop':
            ensure => present;
        'traceroute':
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
            value => 'Prepare for unforeseen consequences';
        'pvp':
            value => false;
        'max-players':
            value => 15;
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
    include permissionsex
    include nocheatplus
    include worldguard

    class { 'nethrar':
        ensure => absent
    }

    class { 'worldborder':
        radius => 2000,
        nether_radius => 500,
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
            value => '1280M';
        'java.cli.X.mx':
            value => '1280M';
        'java.cli.XX.UseLargePages':
            value => 'false';
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
        stage => 'website'
    }
}

