#
# Alejandro Ricoveri
# ---------------------------
# MOTD configuration
# ---------------------------

#
# MOTD header
# ---
class motd (
  $purge    = $motd::params::purge
  ) inherits motd::params {

  #
  /*if $purge == true {
    exec { 'purge_root_dir'
      command => "rm -rf ${root_dir}/*"
    }
  }*/

  #
  define motd::file (
    $source, 
    $ensure = 'latest'
  ) {
    file { "${root_dir}/${priority}-${name}":
      ensure => 'latest',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => $source
    }
  }
  
  #
  # MOTD in /etc/motd
  file { '/etc/motd':
    ensure => 'link',
    target => '/run/motd.dynamic',
  }
}