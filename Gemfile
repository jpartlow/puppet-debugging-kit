source 'https://rubygems.org'

# Local additions and environment variable overrides can be placed in:
#     Gemfile.local
eval(File.read("#{__FILE__}.local"), binding) if File.exists? "#{__FILE__}.local"

gem 'vagrant', :github => 'mitchellh/vagrant', :tag => 'v1.8.5'
gem 'ruby_dep', '~> 1.3.1'

# Gems listed in this group are automatically loaded by the Vagrantfile which
# simulates the action of `vagrant plugin`, which is inactive when running
# under Bundler.
group :plugins do
  gem 'oscar', '>= 0.5'
  gem 'vagrant-vsphere', '>= 1.10.0'
  gem 'vagrant-openstack-provider', '>= 0.7.2'
  gem 'vagrant-norequiretty'
end
