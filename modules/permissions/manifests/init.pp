class permissions {
    include minecraft

    concat { "p_admins":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/admins.txt",
    }

    file { "ops.txt":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        ensure => link,
        path   => "${minecraft::homedir}/ops.txt",
        target => "${minecraft::homedir}/admins.txt",
    }
}

