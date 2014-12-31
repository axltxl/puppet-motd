# == Class: motd::params
#
#  Default parameters used by this module
#
class motd::params {
  $purge     = false
  $motd_dir  = '/etc/update-motd.d'
  $motd_file = '/etc/motd'
  $motd_dyn  = '/run/motd.dynamic'
}