# == Class: motd
#
# Description goes here
#
# === Parameters
#
# [*purge*]
#   Whether to purge all update-motd scripts inside their directory
#   (/etc/update-motd.d). Defaults to false.
#
# [*override_motd*]
#   If true, /etc/motd will be a symlink to /run/motd.dynamic. This is 
#   useful for scenarios in which motd is issued from other sources (login_duo).
#   Defaults to false.
#
# === Authors
#
# Alejandro Ricoveri <alejandroricoveri@gmail.com>
#
# === Copyright
#
# Copyright 2014 Alejandro Ricoveri
#

class motd (
  $purge         = $motd::params::purge,
  $override_motd = $motd::params::override_motd,
  ) inherits motd::params {

  #
  if $purge == true {
    exec { 'purge_root_dir'
      command => "rm -rf ${motd_dir}/*"
    }
  }
  
  if override_motd == true {
    file { $motd_file:
      ensure => 'link',
      target => $motd_dyn,
    }
  }
}