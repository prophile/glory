class essentials {
  minecraft::plugin {"Essentials":
    source  => "puppet:///modules/essentials/Essentials.jar",
    require => File["${minecraft::homedir}/plugins/Essentials/config.yml"]
  }

  minecraft::plugin {"EssentialsProtect":
    source  => "puppet:///modules/essentials/EssentialsProtect.jar",
    require => Minecraft::Plugin["Essentials"]
  }

  minecraft::plugin {"EssentialsSpawn":
    source  => "puppet:///modules/essentials/EssentialsSpawn.jar",
    require => Minecraft::Plugin["Essentials"]
  }

  file {"${minecraft::homedir}/plugins/Essentials":
    ensure  => directory,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0755',
    require => File["${minecraft::homedir}/plugins"]
  }

  file {"${minecraft::homedir}/plugins/Essentials/config.yml":
    ensure  => file,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    content => template('essentials/config.yml.erb'),
    require => File["${minecraft::homedir}/plugins/Essentials"]
  }

  file {"${minecraft::homedir}/plugins/Essentials/spawn.yml":
    ensure  => file,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    require => File["${minecraft::homedir}/plugins/Essentials"]
  }
}

