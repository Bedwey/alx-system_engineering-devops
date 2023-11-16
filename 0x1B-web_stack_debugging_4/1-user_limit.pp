# Modify open files limit for holberton user using 'sed' command 
exec {'change limit to 1024':
  path    => ['/bin/'],
  command => 'sed -i "s/holberton hard nofile 5/holberton hard nofile 1024/" \
  /etc/security/limits.conf'
}

exec {'change limit to 1024':
  path    => ['/bin/'],
  command => 'sed -i "s/holberton soft nofile 4/holberton soft nofile 1024/" \
  /etc/security/limits.conf'
}
