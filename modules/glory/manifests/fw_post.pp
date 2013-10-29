class glory::fw_post {
    # We leave the chain policies as ACCEPT.
    # In case of a dramatic failure, we can just flush the firewall
    # rules and everything will work.
    firewall { '999a drop unmatched input':
        chain  => 'INPUT',
        action => 'drop'
    }

    firewall { '999b drop unmatched forwarding':
        chain  => 'FORWARD',
        action => 'drop'
    }

    firewall { '999c allow all egress traffic':
        chain  => 'OUTPUT',
        action => 'accept'
    }
}
