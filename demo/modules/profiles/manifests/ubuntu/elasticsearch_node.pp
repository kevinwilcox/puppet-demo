class profiles::ubuntu::elasticsearch_node {
  # this uses the elastic/elasticsearch module to setup an
  #   elasticsearch node
  # that module has its own java management component but I
  #   want to manage java separately
  # notice the hiera lookup for node-specific information; this
  #   keeps from needing a separate profile for each node
  require profiles::ubuntu::java
  $nodename = hiera('elasticsearch::nodename')
 
  # just calling the class will cause elasticsearch to be installed 
  class {
    'elasticsearch':
      manage_repo => true,
      repo_version => '5.x',
      restart_on_change => true,
      jvm_options => [
        '-Xms2g',
        '-Xmx2g'
      ]
  } ->
  # cluster.name and network.host should be changed to hiera lookups
  # this could (should?) be addressed with separate per-cluster profiles
  elasticsearch::instance {
    $nodename:
      config => {
        'node.name' => $nodename,
        'cluster.name' => 'puppet-managed-cluster',
        'network.host' => '127.0.0.1',
        'discovery.zen.minimum_master_nodes' => '1' 
      }
  } ->
  # number of replicas and shards are index-specific, in this case
  #   I want to tell all of my indexes to have 0 replicas (single node)
  elasticsearch::template {
    'no_replicas' :
      content => {
        'template' => '*',
        'settings' => {
          'number_of_replicas' => '0'
        }
      }
  }
}
