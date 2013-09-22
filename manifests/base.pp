# -*- mode: ruby -*-
# vi: set ft=ruby :

node default {
    include java7

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
        'adminphile':
            require => Class['minecraft'];
        'nfreader':
            require => Class['minecraft']; }
    minecraft::server_prop {
        'difficulty':
            value => 2,
            require => Class['minecraft'];
        'level-seed':
            value => "eyes",
            require => Class['minecraft'];
        'motd':
            value => 'I like toast',
            require => Class['minecraft'];
    }
}

