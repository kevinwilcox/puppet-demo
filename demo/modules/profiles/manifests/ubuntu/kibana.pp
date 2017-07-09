class profiles::ubuntu::kibana {
  # this uses the elastic/kibana module
  # 192.168.1.113 is the IP of my kibana VM in the demo environment
  # any option that goes in /etc/kibana/kibana.yml is set via
  #   the config => {} hash
  class {
    'kibana' :
      config => {
        'server.host' => '192.168.1.113'
      }
  }
}
