require "tmpdir"

task :t => [:test_unit, :test_integration]

task :test_unit do
    sh "rspec"
end

task :test_integration do
    puts "running integration tests"
    temp_dir = ""

    Dir.mktmpdir {|dir|
        temp_dir = dir
        puts "Temp dir: #{temp_dir}"

        puts "Temp Directory Exists #{File.directory?(temp_dir)}"
    }
    puts "Temp Directory Exists #{File.directory?(temp_dir)}"
end
