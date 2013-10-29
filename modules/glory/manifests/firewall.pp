class glory::firewall {
    exec { 'persist-firewall':
        command     => '/sbin/iptables-save > /etc/sysconfig/iptables',
        refreshonly => true
    }

    Firewall {
        notify => Exec['persist-firewall']
    }

    Firewallchain {
        notify => Exec['persist-firewall']
    }

    class {
        '::firewall':
            before  => Class['glory::fw_post'],
            require => Class['glory::fw_pre']
    }

    resources { "firewall":
        purge => true
    }

    include glory::fw_pre
    include glory::fw_post
}
