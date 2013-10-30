class glory::fw_pre {
    firewall { '000 established/related':
        state  => ['RELATED', 'ESTABLISHED'],
        chain  => 'INPUT',
        action => 'accept'
    }

    firewall { '001 loopback':
        iniface => 'lo',
        chain   => 'INPUT',
        action  => 'accept'
    }

    firewall { '002 ICMP':
        proto  => 'icmp',
        action => 'accept'
    }

    firewall { '003 ssh':
        proto  => 'tcp',
        dport  => 22,
        action => 'accept'
    }

    firewall { '004 http':
        proto  => 'tcp',
        dport  => 80,
        action => 'accept'
    }

    firewall { '005 minecraft':
        proto  => 'tcp',
        dport  => 25565,
        action => 'accept'
    }

    firewall { '006 minecraft query protocol':
        proto  => 'udp',
        dport  => 25565,
        action => 'accept'
    }
}
