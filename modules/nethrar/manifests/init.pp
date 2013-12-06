class nethrar($ensure = 'present') {
  minecraft::plugin {"Nethrar":
    source => "puppet:///modules/nethrar/Nethrar.jar",
    ensure => $ensure
  }

  if $ensure == 'present' {
    minecraft::server_prop{"allow-nether":
      value => false
    }
  } else {
    minecraft::server_prop{"allow-nether":
      value => true
    }
  }
}

