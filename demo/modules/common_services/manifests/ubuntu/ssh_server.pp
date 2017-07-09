class common_services::ubuntu::ssh_server {

  # this is an Ubuntu implementation because the package is
  #   named differently across different platforms
  # the arrow at the end tells puppet to apply things in a specific order
  package {
    'openssh-server':
      ensure => installed
  } ->

  # subscribe tells puppet to restart/reload the openssh server
  #   if /etc/ssh/sshd_config is modified
  # ideally, the configuration will be managed by puppet
  service {
    'openssh-server':
      ensure => running,
      enable => true,
      subscribe => File["/etc/ssh/sshd_config"]
  }

}
