class worldborder($radius) {
  file { "${minecraft::homedir}/plugins/WorldBorder/config.yml":
    content => template('worldborder/border.erb'),
    ensure  => present,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    require => Minecraft::Plugin["WorldBorder"],
    notify  => Service["minecraft"]
  }

  minecraft::plugin {"WorldBorder":
    source  => "puppet:///modules/worldborder/WorldBorder.jar",
  }
}

