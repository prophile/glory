class prism($password) {
  mysql::db { 'prism_logs':
    user     => 'prism',
    password => $password,
    host     => 'localhost',
    grant    => ['all'],
  }

  minecraft::plugin {"Prism":
    source  => "puppet:///modules/prism/Prism-v1.6.8.jar",
    require => [MySQL::DB['prism_logs'],
                File["${minecraft::homedir}/plugins/Prism/config.yml"]]
  }

  file {"${minecraft::homedir}/plugins/Prism":
    require => File["${minecraft::homedir}/plugins"],
    ensure  => directory,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0755'
  }

  file {"${minecraft::homedir}/plugins/Prism/config.yml":
    require => File["${minecraft::homedir}/plugins/Prism"],
    ensure  => file,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0444',
    content => template('prism/config.yml.erb')
  }
}

