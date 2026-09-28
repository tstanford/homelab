# -*- mode: ruby -*-
# vi: set ft=ruby :

numberOfNodes = 2

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder "data", "/vagrant_data"
  config.vm.network "public_network", bridge: "enp4s0"          # <-- set the default bridged network so that it won't prompt everytime

  #master vm
  config.vm.define "xk3s_master" do |k3s_master|      
    k3s_master.vm.hostname = "xk3s-master"

    k3s_master.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "xk3s-master"
      vb.memory = "2048"
      vb.cpus = 2
      vb.check_guest_additions = true
    end

    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_ed25519.pub").first.strip
    config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
  end

  #node vms
  (1..numberOfNodes).each do |nodeNumber|    
    config.vm.define "xk3s-node"+nodeNumber.to_s do |k3s_node|
      k3s_node.vm.hostname = "xk3s-node"+nodeNumber.to_s

      k3s_node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = "xk3s-node"+nodeNumber.to_s
        vb.memory = "1024"
        vb.cpus = 2
        vb.check_guest_additions = true
      end

    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_ed25519.pub").first.strip
    config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
    end
  end

end



