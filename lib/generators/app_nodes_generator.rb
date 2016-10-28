class AppNodesGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))
  def copy_initializer
    copy_file 'templates/app_nodes.rb', 'config/initializers/app_nodes.rb'
  end
end
