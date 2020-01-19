# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./playbook.yml"
  end

  config.vm.box = "generic/debian9"
 
  #vm.provider "vmware_fusion" do |vmware| 
  #  vmware.vmx["memsize"] = "2048" 
  #  vmware.vmx["numvcpus"] = "2"
  #end

  # config.vm.communicator = "winrm"
  # config.winrm -- for windows
  
  config.vm.network :forwarded_port, guest: 80, host: 8800, auto_correct: true 
  
  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.synced_folder "../data", "/vagrant_data", type: "rsync"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provision "shell", inline: "echo 'the end'"  
  # config.vm.provision "shell", path: "bootstrap.sh"

  config.vm.post_up_message = "pop up message"
end