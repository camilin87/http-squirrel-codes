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

        sh "ruby generate.rb \"#{input_file}\" \"#{temp_dir}\""

        Dir.chdir(temp_dir) {
            found_files = Dir["*"].sort
            expected_files = ["100.html", "101.html"]

             if found_files != expected_files
                raise "Generation did not produce the expected result, found_files: #{found_files}"
             end
        }
    }
end
