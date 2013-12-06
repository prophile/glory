# Definition: minecraft::plugin
#
# This definition adds a plugin to the Minecraft server
#
define minecraft::plugin ($source, $ensure = 'present')
{
  $state = $ensure ? {
    'present' => file,
    'absent'  => absent,
    default   => fail("unknown state")
  }

  file { "${name}.jar":
    path   => "${minecraft::homedir}/plugins/${name}.jar",
    ensure => $state,
    source => $source,
    owner  => $minecraft::user,
    group  => $minecraft::group,
    mode   => '0644',
    notify => Service['minecraft'],
  }
}
