class mac_admin::munki::munkitools {

    if $::mac_munki_version < "2.5.1.2630" or $::mac_munki_version == "Munki not installed" {
        package { 'munki_tools2':
            ensure   => installed,
            provider => pkgdmg,
            source   => 'https://github.com/munki/munki/releases/download/v2.5.1/munkitools-2.5.1.2630.pkg',
        }

        ##If we need to, touch the bootstrap file
        if $mac_admin::munki::bootstrap==true{
            exec {'munki-check':
                command     => '/usr/bin/touch /Users/Shared/.com.googlecode.munki.checkandinstallatstartup',
                refreshonly => true,
                subscribe   => Package['munki_tools2'],
            }
        }
    }
}
