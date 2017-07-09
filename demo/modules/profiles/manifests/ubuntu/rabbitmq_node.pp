class profiles::ubuntu::rabbitmq_node {
  # this uses the puppetlabs/rabbitmq module
  # nodename is provided via a hiera lookup
  # I should also set the cluster_nodes to be a hiera lookup
  #   or have per-cluster rabbitmq classes
  # this configuration automatically enables the web management
  #   GUI on u16pclient and sets up a small cluster
  # it adds a user called 'demo' with can log in to the GUI
  # 'demo' is an admin for the cluster so has full permission to /
  # to-do:
  #   remove the guest user (it's just an option in the module)
  #   add queues
  $nodename = hiera('rabbitmq::nodename')

  class { '::rabbitmq' :
    config_cluster => true,
    cluster_nodes => ['u16pclient', 'u16rabbit2'],
    erlang_cookie => 'Iwonderwhatmakesagoodcookie',
    wipe_db_on_cookie_change => true,
    config_management_variables => {
      management_hostname => "u16pclient"
    },
    environment_variables =>  {
      'NODENAME' => "rabbit@$nodename"
    }
  }

  rabbitmq_user { 
    'demo':
      admin => true,
      password => 'demopass'
  }

  rabbitmq_user_permissions { 'demo@/':
    configure_permission => '.*',
    read_permission => '.*',
    write_permission => '.*'
  }

}
