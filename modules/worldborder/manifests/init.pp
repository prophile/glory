class worldborder($radius,
                  $nether_radius) {
  file { "${minecraft::homedir}/plugins/WorldBorder":
    ensure  => directory,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    require => File["${minecraft::homedir}/plugins"]
  }

  file { "${minecraft::homedir}/plugins/WorldBorder/config.yml":
    content => template('worldborder/border.erb'),
    ensure  => present,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0444',
    require => [Minecraft::Plugin["WorldBorder"],
                File["${minecraft::homedir}/plugins/WorldBorder"]],
    notify  => Service["minecraft"]
  }

  minecraft::plugin {"WorldBorder":
    source  => "puppet:///modules/worldborder/WorldBorder.jar",
  }
}

