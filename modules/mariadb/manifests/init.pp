class mariadb {
  package {'mariadb-server':
    ensure => installed,
    notify => Service['mariadb'],
  }

  file {'/etc/mysql/my.cnf':
    source => 'puppet:///modules/mariadb/my.cnf',
    notify => Service['mariadb'],
  }

  service { 'mariadb':
    ensure => running,
    enable => true,
  }
}
