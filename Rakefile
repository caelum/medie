require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "medie"
  gem.homepage = "http://github.com/caelum/medie"
  gem.license = "MIT"
  gem.summary = "A gem that allows you register media types and unmarshal/marshal data accordingly"
  gem.description = "A gem that allows you register media types and unmarshal/marshal data accordingly"
  gem.email = "guilherme.silveira@caelum.com.br"
  gem.authors = ["Guilherme Silveira"]
  gem.version = "1.0.0.beta3"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  version = "1.0.0.beta3"

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "medie #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
