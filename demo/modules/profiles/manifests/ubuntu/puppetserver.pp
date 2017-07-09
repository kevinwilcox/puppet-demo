class profiles::ubuntu::puppetserver {

  # the puppetdevs group has write access to puppet's $modulepath,
  # removes the need to use sudo for each edit (in production $modulepath
  # would be /usr/local/<foo> for the write area)
  group {
    'puppetdevs':
      ensure => present
  }

  # my demo puppet server's main user is 'demo'
  # for production this should be the primary admin for the system
  # everything except the puppetdevs group is a default group for
  # the user added during Ubuntu 16.04 installation
  user {
    'demo':
      ensure => present,
      gid    => 'demo',
      groups => ["adm", "cdrom", "sudo", "dip", "plugdev", "lxd", "lpadmin", "sambashare", "puppetdevs"],
      shell  => '/bin/bash',
      home   => '/home/demo',
      managehome => true
  }

  # puppetlabs-release-pc1 sets the apt repo and installs the GPG key
  # at this point it may be unnecessary but I'm okay with requiring it
  package {
    'puppetlabs-release-pc1':
      ensure => present
  }

  # puppetserver is obviously already installed but for management sake...
  package {
    'puppetserver':
      ensure => present
  }

}
