$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cadence_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cadence_cms"
  s.version     = CadenceCms::VERSION
  s.authors     = ["mpilcher90"]
  s.email       = ["mpilcher90@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CadenceCms."
  s.description = "TODO: Description of CadenceCms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "pg"
end
