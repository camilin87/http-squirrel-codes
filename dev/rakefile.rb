task :t => [:test_unit, :test_integration]

task :test_unit do
    sh "rspec"
end

task :test_integration do
    puts "running integration tests"
end