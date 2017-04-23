require "tmpdir"

task :t => [:test_unit, :test_integration]

task :test_unit do
    sh "rspec"
end

def pwd
    File.dirname(__FILE__)
end

task :test_integration do
    puts "running integration tests"

    Dir.mktmpdir { |temp_dir|
        puts "temp_dir: #{temp_dir}"

        input_file = File.join(pwd, "spec/seed/sample-definition.md")
        puts "input_file: #{input_file}"
    }
end
