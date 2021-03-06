$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "partial_compiler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "partial_compiler"
  s.version     = PartialCompiler::VERSION
  s.authors     = ["Noah Kochanowicz"]
  s.email       = ["noah@getlunchtray.com"]
  s.homepage    = "https://github.com/getlunchtray/partial-compiler"
  s.summary     = "Compiles partials in production for faster load times."
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.1.8"
  s.add_dependency "safe_ruby"

  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
