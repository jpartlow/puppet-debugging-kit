source 'https://rubygems.org'

# Local additions and environment variable overrides can be placed in:
#     Gemfile.local
eval(File.read("#{__FILE__}.local"), binding) if File.exists? "#{__FILE__}.local"

gem 'vagrant', :github => 'mitchellh/vagrant', :tag => 'v1.8.7'

# Gems listed in this group are automatically loaded by the Vagrantfile which
# simulates the action of `vagrant plugin`, which is inactive when running
# under Bundler.
group :plugins do
  gem 'oscar', '>= 0.5.3'
  gem 'vagrant-vsphere', '>= 1.10.0'
  gem 'vagrant-openstack-provider', '>= 0.8.0'
  gem 'vagrant-norequiretty'
end
