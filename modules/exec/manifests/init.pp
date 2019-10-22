class exec {
  exec { 'Run a command':
    command	=> '/bin/echo `/bin/date` > /tmp/out.put',
  }
}
