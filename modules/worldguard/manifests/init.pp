class worldguard {
  minecraft::plugin {"WorldGuard":
    source => "puppet:///modules/worldguard/WorldGuard.jar"
  }

  # Turn off vanilla spawn protection
  minecraft::server_prop { "spawn-protection":
    value => 0;
  }
}

