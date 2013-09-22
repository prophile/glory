# Definition: minecraft::op
#
# This definition adds a player to the Minecraft server's auto-op list
#
define minecraft::op ()
{
  file_line { $name:
    path   =>"${minecraft::homedir}/ops.txt",
    line   => $name,
    notify => Service['minecraft'],
  }

  file_line { "${name}/perms":
    path   => "${minecraft::homedir}/permissions.yml",
    line   => "  ${name}: {group:'admin', permissions:''}",
    match  => "  ${name}:.*",
    notify => Service['minecraft'],
  }
}

