class htop {
  package {'htop':
    ensure	=> installed,
  }

  file {'/home/skylab/.config/htop/htoprc':
    ensure	=> file,
    content	=> '# This file is managed by Puppet',
    require	=> Package['htop'],
  }
}
