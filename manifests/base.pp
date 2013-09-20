class base {
    package { 'screen':
              ensure => present }

    package { 'zsh':
              ensure => present }

    package { 'zsh-doc':
              require => Package['zsh'],
              ensure => present }

    package { 'git':
              ensure => present }
}

