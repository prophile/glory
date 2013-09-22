# Definition: minecraft::mark2_prop
#
# This definition sets a configuration option in the Mark2
# mark2.properties file
#
# Parameters:
# - $value: What the property should be set to
#
# Sample Usage:
#
#  minecraft::mark2_prop { 'plugins.irc.enabled':
#    value => 'false'
#  }
#
define minecraft::mark2_prop (
  $value,
)
{
  file_line { $name:
    path   => "${minecraft::homedir}/mark2.properties",
    line   => "${name}=${value}",
    match  => "${name}=.*",
    notify => Service['minecraft'],
  }
}
