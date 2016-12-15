require 'rubygems'
require 'vagrant/errors'

require 'oscar/version'

module PuppetDebuggingKit
  module PluginChecks
    class DebugKitBadVersion < Vagrant::Errors::VagrantError
      def initialize(plugin, required, actual)
        @error_message = "Outdated debugging kit dependency: #{plugin}\nMinimum required version is: #{required}\nInstalled version is: #{actual}\nTry running: vagrant plugin update"

        super @error_message
      end

      def error_message; @error_message; end
    end

    REQUIRED_OSCAR          = Gem::Requirement.new('>= 0.5.3')
    REQUIRED_OPENSTACK      = Gem::Requirement.new('>= 0.8.0')
    REQUIRED_VSPHERE        = Gem::Requirement.new('>= 1.10.0')

    # Performs sanity checks on required plugins.
    def self.run
      oscar_version     = Gem::Version.new(Oscar::VERSION)
      # Optional plugins.
      openstack_version = begin
                            require 'vagrant-openstack-provider/version'
                            Gem::Version.new(VagrantPlugins::Openstack::VERSION)
                          rescue LoadError
                            nil
                          end
      vsphere_version   = begin
                            require 'vSphere/version'
                            Gem::Version.new(VagrantPlugins::VSphere::VERSION)
                          rescue LoadError
                            nil
                          end

      unless REQUIRED_OSCAR.satisfied_by?(oscar_version)
        raise DebugKitBadVersion.new('oscar', REQUIRED_OSCAR.to_s, oscar_version)
      end

      unless openstack_version.nil? || REQUIRED_OPENSTACK.satisfied_by?(openstack_version)
        raise DebugKitBadVersion.new('vagrant-openstack-provider', REQUIRED_OPENSTACK.to_s, openstack_version)
      end

      unless vsphere_version.nil? || REQUIRED_VSPHERE.satisfied_by?(vsphere_version)
        raise DebugKitBadVersion.new('vagrant-vsphere', REQUIRED_VSPHERE.to_s, vsphere_version)
      end
    end
  end
end
