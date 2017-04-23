require "tmpdir"

task :default => [:generate]

task :t => [:test_unit, :test_integration]

task :test_unit do
    sh "rspec"
end

def pwd
    Dir.pwd
end

def generate(input_file, output_directory)
    sh "ruby generate.rb \"#{input_file}\" \"#{output_directory}\""
end

task :test_integration do
    Dir.mktmpdir { |temp_dir|
        puts "temp_dir: #{temp_dir}"

        input_file = File.join(pwd, "spec/seed/sample-definition.md")
        puts "input_file: #{input_file}"

        generate(input_file, temp_dir)

        Dir.chdir(temp_dir) {
            found_files = Dir["*"].sort
            expected_files = ["100.html", "101.html"]

             if found_files != expected_files
                raise "Generation did not produce the expected result, found_files: #{found_files}"
             end
        }
    }
end

task :generate do
    input_file = File.join(pwd, "squirrels-source.md")
    output_directory = File.expand_path("..", pwd)
    generate(input_file, output_directory)
end
