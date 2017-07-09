class roles::u16_puppet {
  include profiles::ubuntu::base
  include profiles::ubuntu::sudo
  include profiles::ubuntu::puppetserver
}
