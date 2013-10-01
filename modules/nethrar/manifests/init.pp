class nethrar {
  minecraft::plugin {"Nethrar":
    source => "puppet:///modules/nethrar/Nethrar.jar"
  }

  minecraft::server_prop{"allow-nether":
    value => false
  }
}

