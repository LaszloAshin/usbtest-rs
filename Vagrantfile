Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.build_dir = "devenv"
	d.has_ssh = true
  end
  config.vm.provision "shell", path: "devenv/provision.sh", privileged: false
end
