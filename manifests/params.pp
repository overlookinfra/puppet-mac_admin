# just some defaults
class mac_admin::params{
    if ($::operatingsystem=='Darwin') {
        $repourl = 'http://munki'
        $clientidentifier = ''
        $suppressautoinstall = false
        $install_apple_updates = false
        $suppress_stop = false
        $bootstrap = false
        $packageurl = ''
        $catalogurl = ''
        $manifesturl = ''
        $namerurl = 'http://macnamer'
        $crypturl = 'http://crypt'
        $hook_priority = '0'
        $additionalhttpheaders = ''
        $useclientcertificate = false
        $clientcertificatepath = ''
        $clientkeypath = ''
        $softwarerepocacertificate = ''
        $localonlymanifest = ''
        $munki_catalogs = ''
        $munki_managed_installs = ''
        $munki_managed_uninstalls = ''
        $munki_included_manifests = ''
        $munki_managed_updates = ''
        $munki_optional_installs = ''
    }else{
        fail('unsupported operating system')
    }
}
