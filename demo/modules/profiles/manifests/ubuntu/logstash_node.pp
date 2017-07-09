class profiles::ubuntu::logstash_node {
  # this uses the elastic/logstash module
  # create_resources will scour the files in hieradata to
  #   look for a logstash_configs setting; it then puts all of
  #   those into /etc/logstash/conf.d/ for nodes using this profile
  # I want to sort out having one set of configs for ingest nodes and
  #   a different set for filter/enrich and output nodes
  # Breaking it into multiple node types allows for interesting
  #   pipelines and doing things like using message queues
  # My issue right now is I haven't spent enough time with the module to
  #   sort redeclaration issues...I might just have to deal with it
  require profiles::ubuntu::java
  class { 
    'logstash' :
      jvm_options => [
        '-Xms1g',
        '-Xmx1g'
      ],
      settings => {
        'pipeline.batch.size' => 50,
        'pipeline.batch.delay' => 5
      }
  }
  $logstash_configs = hiera('logstash_configs', {})
  create_resources('logstash::configfile', $logstash_configs)
}
