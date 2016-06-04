require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.name = "spec"
  t.warning = false
  t.verbose = false
  t.test_files = FileList['spec/**/*_spec.rb']
end

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.warning = false
  t.verbose = false
  t.name = "spec:stories"
  t.test_files = FileList['spec/stories/**/*_spec.rb']
end

Rake::TestTask.new do |t|
  t.libs = ["lib", "spec"]
  t.name = "spec:units"
  t.warning = false
  t.verbose = false
  t.test_files = FileList['spec/unit/**/*_spec.rb']
end

task :default => :spec