# -*- mode: ruby -*-
# vi: set ft=ruby :

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

    minecraft::op {
        'adminphile':;
        'nfreader': }
    minecraft::server_prop {
        'difficulty':
            value => 2;
        'motd':
            value => 'I like toast';
    }

    include secrets
}

