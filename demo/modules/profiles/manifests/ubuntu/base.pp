class profiles::ubuntu::base {
  # all Ubuntu systems use apt, I want to make sure the apt
  #   cache is updated daily (apt update)
  class { 'apt' :
    update => { frequency => "daily", },
  }

  # this creates /etc/upgrade-waldo on each Ubuntu system.
  # changes to this file will trigger an upgrade of all
  #   installed packages
  file { 'upgrade-waldo':
    ensure => present,
    path => "/etc/upgrade-waldo",
    source => "puppet:///modules/profiles/apt-upgrade-waldo"
  }

  # do an upgrade if the waldo changes.
  # note this upgrades all installed packages! (apt upgrade)
  exec { 'apt-upgrade':
    command => "/usr/bin/apt -y upgrade",
    subscribe => File["/etc/upgrade-waldo"],
    refreshonly => true
  }
}
