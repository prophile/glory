# Definition: minecraft::plugin
#
# This definition adds a plugin to the Minecraft server
#
define minecraft::plugin ($source)
{
  file { "${name}.jar":
    path   => "${minecraft::homedir}/plugins/${name}.jar",
    ensure => file,
    source => $source,
    owner  => $minecraft::user,
    group  => $minecraft::group,
    mode   => '0644',
    notify => Service['minecraft'],
  }
}
