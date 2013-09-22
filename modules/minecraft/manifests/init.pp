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
  file { "${homedir}/spigot.jar":
    ensure  => file,
    source  => 'puppet:///modules/minecraft/spigot.jar',
    owner   => $user
  }

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
  } -> Minecraft::Op<| |>

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
  }

  service { 'minecraft':
    ensure    => running,
    require   => File['/etc/init.d/minecraft'],
    subscribe => File["${homedir}/spigot.jar"],
  }
}

