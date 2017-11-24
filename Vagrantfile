# -*- mode: ruby -*-
# vi: set ft=ruby

# Vagrant configs
VAGRANT_VERSION = '2'

Vagrant.configure(VAGRANT_VERSION) do |config|

  config.vm.box = 'geerlingguy/ubuntu1604'
  config.vm.network 'forwarded_port', guest: 80, host: 8080
  config.vm.network 'private_network', ip: '192.168.50.50', :bridge => '127.0.0.1'

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # Configure openstack in vm
  config.vm.provision 'configuration', type: 'ansible' do |ansible_configuration|
    ansible_configuration.playbook = 'ansible/site.yml'
  end

end
