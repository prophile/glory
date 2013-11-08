class permissions {
    include minecraft

    concat { "p_admins":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/admins.txt",
        force  => true,
    }

    concat { "p_mods":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/mods.txt",
        force  => true,
    }

    concat { "p_mod_permissions":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/mod_permissions.txt",
        force  => true,
    }

    concat { "p_user_permissions":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/user_permissions.txt",
        force  => true,
    }

    concat { "p_global_forbid":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        path   => "${minecraft::homedir}/global_forbid.txt",
        force  => true,
    }

    file { "ops.txt":
        owner  => $minecraft::user,
        group  => $minecraft::group,
        mode   => '0644',
        ensure => link,
        path   => "${minecraft::homedir}/ops.txt",
        target => "${minecraft::homedir}/admins.txt",
    }

    anchor { "p_update":
    }
}

