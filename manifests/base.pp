# -*- mode: ruby -*-
# vi: set ft=ruby :

Exec { path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

node default {
    stage { 'pre': before => Stage['main'] }

    class { 'apt':
        always_apt_update => true,
        stage => 'pre'
    }
    
    class { 'java7':
        stage => 'pre'
    }

    include glory
}

