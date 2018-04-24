$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "app_nodes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_nodes"
  s.version     = AppNodes::VERSION
  s.authors     = ["dharmon"]
  s.email       = ["dusty@theharmons.com"]
  s.homepage    = "http://www.github.com/dfharmon/app_nodes"
  s.summary     = "Provide info on the running nodes of your application."
  s.description = "Provide info on the running nodes of your application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "sysinfo"
  s.add_dependency "jquery-datatables-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
end
