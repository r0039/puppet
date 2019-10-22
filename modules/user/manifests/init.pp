class user {
  user { 'jocker':
    ensure	=> present,
    comment	=> 'Jocker User',
    home	=> '/home/jocker',
    managehome	=> true
  }

  user { 'xmen':
    ensure	=> present,
    comment	=> 'Xmen',
    home	=> '/home/xmen',
    managehome	=> true,
    shell	=> '/bin/bash'
  }
  ssh_authorized_key { 'xmen':
  user	=> 'xmen',
  type	=> 'rsa',
  key	=> 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDb5f7CMNRxF0hKTHNbkhwnWNg036KDN+2GseDVlBv7LyLeFUcO0onE+f+0h2wLmmKBwBCRG7d+NZKb0AW7cBzt1AINX556PgmJyh5tVaXT/xfNdU+pElWORCYJTegjA1jKG+egWO0BUhL8gMb7ndcOSQteXPbCJzbUD/vqwoPlDZZktVM01P/rUZxV9uJSuKwfo9LC4WRldZFjJrXwjCcL+e/zg+ts3QQOANf2uqle9SMUMBI6MnwAIgeq2SKDY81Cwfnn/KQfrQ4IO4bzLFu80NWM3pJkdLQmubNYO5vp4/S80MpYPg0ytkn4DM+Q387LLCt6JTdMYbekp7q3016x'
  }

  user { 'heneiken':
    ensure	=> present,
    comment	=> 'Beer',
    home	=> '/home/heneiken',
    managehome	=> true
  }

}
