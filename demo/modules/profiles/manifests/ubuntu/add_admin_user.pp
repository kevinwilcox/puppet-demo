class profiles::ubuntu::add_admin_user {
  # this class adds a user named 'test_user', makes sure
  #   the user is in the 'sudo' group, adds a group named
  #   'test_user' and sets a password
  # the password is 'testpass' and the hash was generated with
  #   openssl passwd -l
  # that is a lowercase-L above, not the number one
  require Class["sudo::ubuntu::install_sudo"]
  group {
    'test_user':
      ensure => present
  } ->
  user {
    'test_user':
      ensure => present,
      gid    => 'test_user',
      groups => ["sudo"],
      managehome => true,
      password => '$1$40jWzJJh$NA75EXeKeu8O5C3pojhhD/'
  }
}
