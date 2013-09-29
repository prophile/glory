class essentials {
  require "minecraft"

  minecraft::plugin {"Essentials":
    source => "puppet:///modules/essentials/essentials.jar"
  }
}

