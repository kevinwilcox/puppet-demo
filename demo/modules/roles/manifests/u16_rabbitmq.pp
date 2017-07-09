class roles::u16_rabbitmq {
  include profiles::ubuntu::base
  include profiles::ubuntu::sudo
  include profiles::ubuntu::add_admin_user 
  include profiles::ubuntu::rabbitmq_node
}
