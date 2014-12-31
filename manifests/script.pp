# == Define: motd::script
#
# See README.md
#
define motd::script (
  $ensure   = 'latest',
  $source,
  $owner    = 'root',
  $group    = 'root',
  $mode     = '0755',
  $priority = 10,
) {
  
  include motd::params
  $motd_dir = $motd::params::motd_dir
 
  # Make sure compilation will fail if 'motd' doesn't get declared:
  Class['motd'] -> Motd::Script <| |>

  file { "${motd_dir}/${priority}-${name}":
    ensure => $ensure,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    source => $source
  }
}