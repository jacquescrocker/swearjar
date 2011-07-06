# encoding: utf-8

require 'rake'
require 'rake/gempackagetask'

# begin
#   require 'jeweler'
#   Jeweler::Tasks.new do |s|
#     s.name = "swearjar"
#     s.description = s.summary = "Put another nickel in the swearjar. Simple profanity detection with content analysis."
#     s.email = "joshbuddy@gmail.com"
#     s.homepage = "http://github.com/joshbuddy/swearjar"
#     s.authors = "Joshua Hull"
#     s.files = FileList["[A-Z]*", "{lib,spec,config}/**/*"]
#     s.add_dependency 'fuzzyhash', '>=0.0.11'
#     s.add_dependency 'dirge', '>=0.0.3'
#   end
#   Jeweler::GemcutterTasks.new
# rescue LoadError
#   puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
# end

require 'spec'
require 'spec/rake/spectask'

gemspec = eval(File.read('swearjar.gemspec'))
Rake::GemPackageTask.new(gemspec) do |pkg|
  pkg.gem_spec = gemspec
end

desc "build the gem and release it to rubygems.org"
task :release => :gem do
  puts "Tagging #{gemspec.version}..."
  system "git tag -a #{gemspec.version} -m 'Tagging #{gemspec.version}'"
  puts "Pushing to Github..."
  system "git push --tags"
  puts "Pushing to rubygems.org..."
  system "gem push pkg/#{gemspec.name}-#{gemspec.version}.gem"
end

task :spec => 'spec:all'
namespace(:spec) do
  Spec::Rake::SpecTask.new(:all) do |t|
    t.spec_opts ||= []
    t.spec_opts << "-rubygems"
    t.spec_opts << "--options" << "spec/spec.opts"
    t.spec_files = FileList['spec/**/*_spec.rb']
  end
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('spec_with_rcov') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

require 'rake/rdoctask'
desc "Generate documentation"
Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.rdoc_dir = 'rdoc'
end
