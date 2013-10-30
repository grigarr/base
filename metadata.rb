name             'base'
maintainer       'Oregon State University'
maintainer_email 'rudy@osuosl.org'
license          'Apache 2.0'
description      'Installs/Configures base packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends          'chef_handler'
depends          'user'
depends          'openssh'
depends          'yum'
depends          'apt'
depends          'selinux'
depends          'postfix'
depends          'firewall'
depends          'nagios'
depends          'ntp'
depends          'sudo'
depends          'monitoring'
depends          'sysctl'
depends          'rsyslog'
depends          'osl-munin'
depends          'aliases'
depends          'networking_basic'
depends          'chef-client'
