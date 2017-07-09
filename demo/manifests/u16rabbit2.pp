# this is an Ubuntu 16 system used only as a rabbitmq node
# it is name u16rabbit2 because u16pclient was the first rabbitmq box
node 'u16rabbit2' {
  include roles::u16_rabbitmq
}
