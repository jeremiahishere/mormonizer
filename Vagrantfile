APP_NAME = CHANGE ME

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "cloudspace_training"

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  config.vm.network "33.33.33.21"

  # Share your app folder with the box.
  config.vm.share_folder "app", "/srv/#{APP_NAME}", "."

  # Path to the SSH key
  config.ssh.private_key_path = File.join(ENV['HOME'], '.ssh', 'cs_vagrant.pem')

  # Make the box not suck
  config.vm.customize do |vm|
    vm.name = "#{APP_NAME} Dev"
    vm.memory_size = 1024
    vm.cpu_count = 2
  end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organizations/cloudspace"
    chef.validation_key_path = "cloudspace-validator.pem"
    chef.validation_client_name = "cloudspace-validator"
    chef.node_name = "#{APP_NAME}_vagrant"

    chef.add_recipe "chef-client::delete_validation"
    chef.add_recipe "ubuntu"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"
    chef.add_recipe "apache2"
    chef.add_recipe "passenger_apache2"
    chef.add_recipe "passenger_apache2::mod_rails"
    chef.add_recipe "postfix"
    chef.add_recipe "imagemagick"
    chef.add_recipe "memcached"

    chef.json = {
      :mysql => {
        :server_root_password => 'password'
      }, 
      :postfix => {
        :mydomain => 'cloudspace.com'
      }
    }
  end
end
