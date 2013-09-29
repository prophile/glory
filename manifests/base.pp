# -*- mode: ruby -*-
# vi: set ft=ruby :

Exec { path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

node default {
    require java7

    exec { 'apt-update':
           command => '/usr/bin/apt-get update' }

    package { 'screen':
              require => Exec['apt-update'],
              ensure => present }

    package { 'zsh':
              require => Exec['apt-update'],
              ensure => present }

    package { 'zsh-doc':
              require => Package['zsh'],
              ensure => present }

    package { 'git':
              require => Exec['apt-update'],
              ensure => present }

    group { 'minecraft':
            ensure => present }

    user { 'minecraft':
            managehome => true,
            require => Group['minecraft'],
            gid => 'minecraft',
            ensure => present }

    class { 'minecraft':
            user => 'minecraft',
            group => 'minecraft',
            homedir => '/home/minecraft',
            require => [User['minecraft'], Package['screen']]
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
    }

    include secrets

    class {'essentials': }
}

