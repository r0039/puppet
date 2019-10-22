#node 'puppet-agent-01.office' {
#  file {'/tmp/it_works.txt':
#    ensure => present,
#    mode => '0664',
#    content => "It works on ${ipaddress_ens18}!\n",
#  }
#
#  class {'rsync':
#    package_ensure => 'latest'
#  }
#}
#
#node 'puppet-agent-02.office' {
#  file {'/tmp/hello':
#    ensure => present,
#    mode => '0775',
#    content => "My IP is ${ipaddress_ens18}!\n",
#  }
#
#  class {'nginx':
#    package_ensure => 'latest',
#  }
#
#  include lamp
#}

node 'puppet-agent-01.office' {
class { 'apache':
  default_vhost => false,
  default_mods	=> false,
  mpm_module	=> 'prefork',
}

include apache::mod::php
apache::vhost { 'example.office':
  port	=> '80',
  docroot	=> '/var/www/user',
  docroot_owner	=> 'www-data',
  docroot_group	=> 'www-data',
}

class { 'mysql::server':
  root_password	=> 'password',
  remove_default_accounts	=> true
}

file { 'info.php':
  path	=> '/var/www/user/info.php',
  ensure	=> file,
  require	=> Class['apache'],
  source	=> 'puppet:///modules/apache/info.php',
}

file { 'disable_strict_mode.cnf':
  path	=> '/etc/mysql/mysql.conf.d/disable_strict_mode.cnf',
  ensure	=> file,
  require	=> Class['mysql::server'],
  source	=> 'puppet:///modules/mysql/disable_strict_mode.cnf'
}
}

node 'puppet-agent-02.office' {
  include user
  include sudoers
  include exec
  include cowsay
  include htop
  include mariadb
}
