class mac_admin::munki_ssl {
  if $::operatingsystem != 'Darwin' {
      fail('The munki_ssl module is only supported on Darwin/OS X')
  }
  
  file { ['/Library/Managed Installs', '/Library/Managed Installs/certs/' ]:
    ensure => directory,
    owner  => 'root',
    group  => 'wheel',
  }

  file { '/Library/Managed Installs/certs/ca.pem':
    mode    => '0640',
    owner   => root,
    group   => wheel,
    source  => "${settings::confdir}/ssl/certs/ca.pem",
    require =>  File['/Library/Managed Installs/certs/'],
  }
 
  file { '/Library/Managed Installs/certs/clientcert.pem':
    mode    => '0640',
    owner   => root,
    group   => wheel,
    source  => "${settings::confdir}/ssl/certs/${clientcert}.pem",
    require =>  File['/Library/Managed Installs/certs/'],
  }
 
  file { '/Library/Managed Installs/certs/clientkey.pem':
    mode    => '0640',
    owner   => root,
    group   => wheel,
    source  => "${settings::confdir}/ssl/private_keys/${clientcert}.pem",
    require =>  File['/Library/Managed Installs/certs/'],
  }
}
