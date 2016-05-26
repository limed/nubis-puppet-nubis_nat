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
#   Automatically symlinks /usr/local/bin/nat.sh to /etc/nubis.d/0-3-nat
#
# * `startup_order`
#   What number do you want this to startup as, it just prepends a number in front of the symlink. Defaults to 0-3
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
    $startup_order              = '0-3',
    $nat_in_interface           = 'eth1',
    $nat_out_interface          = 'eth0',
    $daemonize                  = true,
){

    if !($ensure in ['present', 'absent']) {
        fail("Parameter ${ensure} is not a valid parameter")
    }

    if $ensure == 'present' {
        $file_ensure        = 'file'
        $link_ensure        = 'link'
        $directory_ensure   = 'directory'
    }
    else {
        $file_ensure        = 'absent'
        $link_ensure        = 'absent'
        $directory_ensure   = 'directory'
    }

    file { '/usr/local/bin/nat.sh':
        ensure  => $file_ensure,
        owner   => root,
        group   => root,
        mode    => '0755',
        content => template('nubis_nat/nat.sh.erb'),
    }

    file { '/etc/sysctl.d/01-nat-sysctl.cfg':
        ensure  => $file_ensure,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('nubis_nat/01-nat-sysctl.cfg.erb'),
    }

    file { '/usr/local/bin/nubis-ha-nat':
        ensure  => $file_ensure,
        owner   => root,
        group   => root,
        mode    => '0755',
        content => template('nubis_nat/ha-nat.sh.erb'),
        require => File['/usr/local/bin/nat.sh'],
    }

    if $auto {
        file { "/etc/nubis.d/${startup_order}-nat":
            ensure  => $link_ensure,
            target  => '/usr/local/bin/nat.sh',
            require => File['/usr/local/bin/nat.sh'],
        }
    }

    if $daemonize {

        file { '/var/log/ha-nat':
            ensure => $directory_ensure,
            owner  => root,
            group  => root,
            mode   => '0744',
        }

        file { '/etc/ha-nat-supervisor.conf':
            ensure  => $file_ensure,
            owner   => root,
            group   => root,
            mode    => '0755',
            source  => 'puppet:///modules/nubis_nat/supervisor/ha-nat-supervisor.conf',
            require => [ File['/var/log/ha-nat'] ],
        }

        file { '/etc/init.d/ha-nat':
            ensure  => $file_ensure,
            owner   => root,
            group   => root,
            mode    => '0755',
            source  => 'puppet:///modules/nubis_nat/ha-nat.init',
            require => [ File['/etc/ha-nat-supervisor.conf'] ],
        }

        file { '/etc/logrotate.d/nubis-ha-nat':
            ensure  => $file_ensure,
            owner   => root,
            group   => root,
            mode    => '0644',
            source  => 'puppet:///modules/nubis_nat/supervisor/nubis-ha-nat-logrotate',
            require => [ File['/etc/ha-nat-supervisor.conf'], File['/var/log/ha-nat'] ],
        }

        service { 'ha-nat':
            ensure  => running,
            enable  => true,
            status  => '/usr/local/bin/supervisorctl -c /etc/ha-nat-supervisor.conf status ha-nat | awk \'/^ha-nat[: ]/{print \$2}\' | grep \'^RUNNING$\'',
            require => [ File['/etc/ha-nat-supervisor.conf'], File['/etc/init.d/ha-nat'] ],
        }
    }

}
