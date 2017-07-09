class roles::u16_everything {
  include profiles::ubuntu::base
  include profiles::ubuntu::sudo
  include profiles::ubuntu::add_admin_user
  include profiles::ubuntu::java
  include profiles::ubuntu::logstash_node
  include profiles::ubuntu::elasticsearch_node
  include profiles::ubuntu::kibana
  include profiles::ubuntu::rabbitmq_node
}
