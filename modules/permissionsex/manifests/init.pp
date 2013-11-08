class permissionsex {
  include minecraft

  python::pip { 'pyyaml':; }

  file { "${minecraft::homedir}/generate_permissions.py":
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    source  => "puppet:///modules/permissionsex/generate_permissions.py",
    require => User['minecraft'],
    ensure  => file
  }

  file { "${minecraft::homedir}/plugins/PermissionsEx":
    owner   => $minecraft::user,
    group   => $minecraft::group,
    ensure  => directory,
    mode    => '0755',
    require => File["${minecraft::homedir}/plugins"]
  }

  exec { "python generate_permissions.py":
    cwd     => $minecraft::homedir,
    user    => $minecraft::user,
    group   => $minecraft::group,
    require => [File["${minecraft::homedir}/plugins/PermissionsEx"],
                File["${minecraft::homedir}/admins.txt"],
                File["${minecraft::homedir}/mods.txt"],
                File["${minecraft::homedir}/mod_permissions.txt"],
                File["${minecraft::homedir}/user_permissions.txt"],
                Python::Pip['pyyaml']],
    refreshonly => true,
    subscribe => Anchor['p_update'],
    notify    => Service['minecraft'],
  }

  minecraft::plugin {"PermissionsEX":
    source => "puppet:///modules/permissionsex/PermissionsEx.jar"
  }
}

