class permissions {
    include minecraft

    concat { "p_admins":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/admins.txt",
    }

    concat { "p_mods":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/mods.txt",
    }

    concat { "p_mod_permissions":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/mod_permissions.txt",
    }

    concat { "p_user_permissions":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/user_permissions.txt",
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

