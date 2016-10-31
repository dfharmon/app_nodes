require 'sysinfo'

module AppNodes
  class Engine < ::Rails::Engine
    isolate_namespace AppNodes

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # Only do this after the migration has been run
    if defined?(AppNodes::Node)
      config.after_initialize do
        sysinfo = ::SysInfo.new
        name = sysinfo.hostname
        node = Node.find_or_initialize_by(name: name)
        node.address = sysinfo.ipaddress_internal
        node.version = Rails.application&.version
        node.extended_info = Rails.application&.extended_info
        node.save
      end
    end
  end

  class << self
    mattr_accessor :use_cancancan, :manual_add_allowed, :bootstrap_datatables
    self.use_cancancan = false
    self.manual_add_allowed = false
    self.bootstrap_datatables = false

    # add default values of more config vars here
  end

  # this function maps the vars from your app into your engine
  def self.setup(&block)
    yield self
  end

end
