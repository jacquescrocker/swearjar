Gem::Specification.new do |s|
  s.name = "swearjar"
  s.version = "0.0.2"

  s.homepage = "http://github.com/joshbuddy/swearjar"
  s.authors = ["Joshua Hull"]

  s.description = "Put another nickel in the swearjar. Simple profanity detection with content analysis."
  s.email = "joshbuddy@gmail.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]

  s.files = Dir['lib/**/*', 'spec/**/*', 'config/**/*', 'VERSION', 'README.rdoc', 'Rakefile', "swearjar.gemspec"]
  s.test_files = Dir['spec/**/*']

  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.6"

  s.add_runtime_dependency("fuzzyhash", [">= 0.0.11"])
end

