class glory::firewall {
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
