# -*- mode: ruby -*-
# vi: set ft=ruby :

Exec { path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

node default {
    include secrets

    stage { 'pre': before => Stage['main'] }

    class { 'apt':
        always_apt_update => true,
        stage => 'pre'
    }

    class { 'java7':
        stage => 'pre'
    }

    package { 'screen':
              ensure => present }

    package { 'zsh':
              ensure => present }

    package { 'zsh-doc':
              require => Package['zsh'],
              ensure => present }

    package { 'git':
              ensure => present }

    group { 'minecraft':
            ensure => present }

    user { 'minecraft':
            managehome => true,
            require => Group['minecraft'],
            gid => 'minecraft',
            ensure => present }

    class { 'mysql::server':
            root_password => $secrets::mysql_root,
    }

    class { 'minecraft':
            user => 'minecraft',
            group => 'minecraft',
            homedir => '/home/minecraft',
            require => [User['minecraft'], Package['screen'], Class['java7']]
            }

    class { 'permissions':
            require => User['minecraft']
    }

    class { 'python':
            pip => true,
            dev => true
        }

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

    include essentials
    include worldedit
    include prism
    include nethrar
    include permissionsex
    include nocheatplus
    include worldguard

    class {'worldborder':
        radius => 1000,
    }

    include longbackup

    include glory
    include staff

    minecraft::server_prop {
        'enable-query':
            value => 'true';
        'query.port':
            value => 25565;
        'enable-rcon':
            value => 'false';
    }
}

