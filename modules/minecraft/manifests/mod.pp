# Definition: minecraft::mod
#
# This definition adds a player to the Minecraft server's mod list
#
define minecraft::mod ()
{
  file_line { "${name}/perms":
    path   => "${minecraft::homedir}/permissions.yml",
    line   => "  ${name}: {group:'mod', permissions:''}",
    match  => "  ${name}:.*",
    notify => Service['minecraft'],
  }
}

