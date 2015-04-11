require 'rake/testtask'

task :console do
  require_relative 'lib/prime.rb'
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['spec/*_spec.rb']
  t.verbose = true
end
