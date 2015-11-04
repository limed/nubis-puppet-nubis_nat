# Class: nubis_nat
# ===========================
#
# Copies a templatized script that setups an iptable rule that will setup
# an ec2 instance as a NAT instance
#
# Parameters
# ----------
#
# * `ensure`
#   Ensure if modules exists, defaults to present
#
# * `auto`
#   Automatically symlinks /usr/local/bin/nat.sh to /etc/nubis.d/99-nat
#
# * `startup_order`
#   What number do you want this to startup as, it just prepends a number in front of the symlink. Defaults to 99
#
# * `nat_interface`
#   Which interface do we want our nat instance to be in, defaults to eth0
#
# * `disable_interface`
#   Which interface to disable, defaults to undef
#
# Examples
# --------
#
#    class { 'nubis_nat':
#       nat_interface     => 'eth0',
#       disable_interface => 'eth1',
#    }
#
# Authors
# -------
#
# Ed Lim <limed@mozilla.com>
#
# Copyright
# ---------
#
# Copyright 2015 Ed Lim
#
class nubis_nat(
    $ensure                     = 'present',
    $auto                       = true,
    $startup_order              = '99',
    $nat_interface              = 'eth0',
    $disable_route_interface    = undef,
){

    if !($ensure in ['present', 'absent']) {
        fail("Parameter ${ensure} is not a valid parameter")
    }

    if $ensure == 'present' {
        $file_ensure    = 'file'
        $link_ensure    = 'link'
    }
    else {
        $file_ensure    = 'absent'
        $link_ensure    = 'absent'
    }

    file { '/usr/local/lib/util.sh':
        ensure => $file_ensure,
        owner  => root,
        group  => root,
        mode   => '0744',
        source => 'puppet:///modules/nubis_nat/util.sh'
    }

    file { '/usr/local/bin/nat.sh':
        ensure  => $file_ensure,
        owner   => root,
        group   => root,
        mode    => '0755',
        content => template('nubis_nat/nat.sh.erb'),
        require => File['/usr/local/lib/util.sh'],
    }

    if $auto {
        file { "/etc/nubis.d/${startup_order}-nat":
            ensure  => $link_ensure,
            target  => '/usr/local/bin/nat.sh',
            require => File['/usr/local/bin/nat.sh'],
        }
    }

}
