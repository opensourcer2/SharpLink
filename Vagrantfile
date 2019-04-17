# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.define "sharplink"
  config.vm.box = "windows-10-amd64"
  config.vm.hostname = "sharplink"
  
  config.vm.provider :virtualbox do |vb|
    vb.name = "SharpLink"
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  end

# Visual Studio 2012
  config.vm.provision :chef_solo do |chef|
	chef.add_recipe "chocolatey"
  end

  config.vm.provision "shell", 
	inline: "choco install visualstudio2012wdx -y"

end
