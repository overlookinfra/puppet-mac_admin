class mac_admin::munki_local_manifest(
    $munki_catalogs = $mac_admin::params::munki_catalogs,
    $munki_managed_installs = $mac_admin::params::munki_managed_installs,
    $munki_managed_uninstalls = $mac_admin::params::munki_managed_uninstalls,
    $munki_included_manifests = $mac_admin::params::munki_included_manifests,
    $munki_managed_updates = $mac_admin::params::muki_managed_updates,
    $munki_optional_installs = $mac_admin::params::munki_optional_installs,
    ) inherits mac_admin::params {

  if $::operatingsystem != 'Darwin' {
      fail('The mac_admin module is only supported on Darwin/OS X')
  } 

  file { '/Library/Managed Installs/manifests/':
    ensure => 'directory',
    owner  => 'root',
    group  => 'admin',
    mode   => '0755',
  }

  file { "/Library/Managed Installs/manifests/${clientcert}.plist":
    ensure  => 'file',
    owner   => 'root',
    group   => 'admin',
    mode    => '0644',
    content => template('mac_admin/com.puppet.it.munki_local_manifest.erb'),
    require => File['/Library/Managed Installs/manifests/'],
  }

  property_list_key { 'catalogs':
    ensure     => 'present',
    path       => "/Library/Managed Installs/manifests/${clientcert}.plist",
    key        => 'catalogs',
    value      => ['software1', 'software2'],
    value_type => 'array',
    require    => File["/Library/Managed Installs/manifests/${clientcert}.plist"],
  }  
}
