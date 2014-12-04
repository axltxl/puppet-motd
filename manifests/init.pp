#
# Alejandro Ricoveri
# ---------------------------
# MOTD configuration
# ---------------------------

#
# MOTD header
# ---
class motd ($file = undef) {
  file { '/etc/update-motd.d/00-blanclink':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => $file
  }
  
  #
  # MOTD in /etc/motd
  # ---
  # The standard way of issuing the motd by Ubuntu is
  # normally jeopardized by Duo Security, so in order to
  # force the motd to be issued as we know it we need to
  # put it as a symlink manually
  #
  file { '/etc/motd':
    ensure => 'link',
    target => '/run/motd.dynamic',
  }
}