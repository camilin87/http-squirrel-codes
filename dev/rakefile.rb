require "tmpdir"

task :t => [:test_unit, :test_integration]

task :test_unit do
    sh "rspec"
end

task :test_integration do
    puts "running integration tests"

    Dir.mktmpdir {|temp_dir|
        puts "Temp Dir: #{temp_dir}"
    }
end
