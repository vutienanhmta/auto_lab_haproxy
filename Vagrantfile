# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Cấu hình máy ảo cho HAProxy
  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.box = "ubuntu/bionic64"
    haproxy.vm.network "private_network", ip: "192.168.56.10"
    haproxy.vm.provision "shell", path: "setup-haproxy.sh"
  end

  # Cấu hình máy ảo cho Nginx-1
  config.vm.define "nginx1" do |nginx1|
    nginx1.vm.box = "ubuntu/bionic64"
    nginx1.vm.network "private_network", ip: "192.168.56.11"
    nginx1.vm.provision "shell", path: "setup-nginx.sh"
  end

  # Cấu hình máy ảo cho Nginx-2
  config.vm.define "nginx2" do |nginx2|
    nginx2.vm.box = "ubuntu/bionic64"
    nginx2.vm.network "private_network", ip: "192.168.56.12"
    nginx2.vm.provision "shell", path: "setup-nginx.sh"
  end

    # Cấu hình máy ảo cho k6
  config.vm.define "k6" do |k6|
    k6.vm.box = "ubuntu/bionic64"
    k6.vm.network "private_network", ip: "192.168.56.13"
    k6.vm.provision "shell", path: "setup-k6.sh"
  end
end
