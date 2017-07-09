class sudo::ubuntu::install_sudo {

  # this is an Ubuntu implementation because the package _might_
  #   be named something else on another platform
  # the arrow ensures the package is installed before adding the
  #   sudo group
  package {
    'sudo':
      ensure => installed
  } ->

  group {
    'sudo':
      ensure => present
  }

}
