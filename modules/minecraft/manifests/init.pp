# Class: minecraft
#
# This class installs and configures a Minecraft server
#
# Parameters:
# - $user: The user account for the Minecraft service
# - $group: The user group for the Minecraft service
# - $homedir: The directory in which Minecraft stores its data
# - $heap_size: The maximum Java heap size for the Minecraft service in megabytes
# - $heap_start: The initial Java heap size for the Minecraft service in megabytes
#
# Sample Usage:
#
#  class { 'minecraft':
#    user      => 'mcserver',
#    group     => 'mcserver',
#    heap_size => 4096,
#  }
#
class minecraft(
  $user          = 'mcserver',
  $group         = 'mcserver',
  $homedir       = '/opt/minecraft',
  $heap_size     = 2048,
  $heap_start    = 512,
)
{
  python::pip { 'mark2':
    ensure => present
  }

  file { "${homedir}/spigot.jar":
    ensure  => file,
    source  => 'puppet:///modules/minecraft/spigot.jar',
    owner   => $user
  }

  file { "${homedir}/mark2.properties":
    ensure => file,
    owner  => $user,
    group  => $group,
    source => 'file:///usr/local/lib/python2.7/dist-packages/mk2/resources/mark2.default.properties',
    mode   => '0644',
  } -> Minecraft::Mark2_Prop<| |>

  file { "${homedir}/server.properties":
    ensure => present,
    owner  => $user,
    group  => $group,
    mode   => '0664',
  } -> Minecraft::Server_Prop<| |>

  file { "${homedir}/ops.txt":
    ensure => present,
    owner  => $user,
    group  => $group,
    mode   => '0664',
  }

  file { "${homedir}/permissions.yml":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    source  => 'puppet:///modules/minecraft/permissions.yml',
    require => File["${homedir}/ops.txt"],
  }

  File["${homedir}/permissions.yml"] -> Minecraft::Op<| |>
  File["${homedir}/permissions.yml"] -> Minecraft::Mod<| |>

  file { "${homedir}/banned-players.txt":
    ensure => present,
    owner  => $user,
    group  => $group,
    mode   => '0664',
  } -> Minecraft::Ban<| |>

  file { "${homedir}/banned-ips.txt":
    ensure => present,
    owner  => $user,
    group  => $group,
    mode   => '0664',
  } -> Minecraft::Ipban<| |>

  file { "${homedir}/white-list.txt":
    ensure => present,
    owner  => $user,
    group  => $group,
    mode   => '0664',
  } -> Minecraft::Whitelist<| |>

  file { '/etc/init.d/minecraft':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    content => template('minecraft/minecraft_init.erb'),
    require => Python::Pip['mark2']
  }

  service { 'minecraft':
    ensure    => running,
    require   => File['/etc/init.d/minecraft'],
    subscribe => File["${homedir}/spigot.jar"],
  }

  minecraft::mark2_prop {
    'mark2.jar-path':
        value => 'spigot.jar';
  }
}

