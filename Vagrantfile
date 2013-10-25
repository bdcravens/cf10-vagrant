# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "10.10.10.133"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "/Users/billycravens/code/cf10-installers", "/cf_installer"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #

  config.berkshelf.enabled = true


  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    # chef.roles_path = "../my-recipes/roles"
    # chef.data_bags_path = "../my-recipes/data_bags"

    chef.add_recipe "apt"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "main"
    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_ssl"
    chef.add_recipe "coldfusion10"
    chef.add_recipe "coldfusion10::apache"
    chef.add_recipe "coldfusion10::configure"
    
    #chef.add_role "web"
  
    # You may also specify custom JSON attributes:
    chef.json = { 
      :cf10 => {
        :installer => 
        {:local_file => "/cf_installer/ColdFusion_10_WWEJ_linux64.bin"},
        "config_settings" => {
          "datasource" => {
            "MySQL5" => [
              {
                "name" => "vagrantdb",
                "host" => "10.0.2.15",
                "database" => "vagrantdb",
                "username" => "root",
                "password" => "vagrant",
                "sendStringParametersAsUnicode" => true,
                "disable_clob" => false,
                "disable_blob" => false,
              }
            ]
          }
        }
      },
      :mysql => {
        :allow_remote_root => true,
        :server_root_password => "vagrant",
        :server_debian_password => "vagrant", 
        :server_repl_password => "vagrant"
      }

    }
  end

end
