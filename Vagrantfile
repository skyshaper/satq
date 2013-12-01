# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  
  script = <<SCRIPT
  apt-get update
  apt-get install -y python-software-properties
  apt-add-repository -y ppa:brightbox/ruby-ng-experimental
  echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
  apt-get update
  apt-get install -y ruby2.0 ruby2.0-dev postgresql-9.3 postgresql-server-dev-9.3 build-essential git
  sudo -u postgres createuser --superuser vagrant
  gem install bundler
  cd /vagrant && sudo -u vagrant bundle
SCRIPT
  
  config.vm.provision :shell, inline: script
end
