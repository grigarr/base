# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "base-berkshelf"

  # Download the openstack box
  config.vm.box = "openstack"
  config.vm.box_url = "http://packages.osuosl.org/vagrant/openstack.box"

  # Install chef omnibus
  config.omnibus.chef_version = :latest

  # Enable berkshelf
  config.berkshelf.enabled = true

  # Setup ssh key stuff for sshing into the vm
  config.ssh.private_key_path = "#{ENV['OS_SSH_KEY']}" # Your openstack ssh private key location
  
  # Tell vagrant the IP to ssh to
  config.ssh.host = "#{ENV['OS_FLOATING_IP']}"

  # Set OpenStack Variables for instance creation
  config.vm.provider :openstack do |os|
    os.username     = "#{ENV['OS_USERNAME']}"               # OpenStack username
    os.flavor       = /m1.tiny/                             # Change this based upon you resource requirements
    os.image        = "CentOS 6.4"
    os.endpoint     = "http://10.1.0.27:35357/v2.0/tokens"
    os.keypair_name = "#{ENV['OS_SSH_KEYPAIR']}"            # Name of you ssh keypair that you setup in the browser (should be your username)
    os.ssh_username = "centos"                              # login for the VM
    os.security_groups = ['default']                        # add different security groups here for different ports
    os.tenant       = "OSL"                                 # always use OSL as the tenant
    os.server_name  = "#{ENV['USER']}-openstack"            # label for the instance
    os.floating_ip  = "#{ENV['OS_FLOATING_IP']}"            # instance floating ip, make sure you claim from dns
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      },
      :authorization => {
        :sudo => {
          :users => ['vagrant', 'centos'],
          :passwordless => true
        }
      }
    }

    # If using data bags, tell vagrant where they are located
    chef.data_bags_path = "/home/#{ENV['USER']}/git/chef-repo/data_bags"

    chef.run_list = [
        "recipe[base::managed]"
    ]
  end
end
