# -*- mode: ruby -*-
# vi: set ft=ruby :

Exec { path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

node default {
    include glory
}

