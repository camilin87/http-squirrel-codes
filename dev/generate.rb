require_relative "lib/formatter"
require_relative "lib/parser"
require_relative "lib/downloader"
require_relative "lib/status_code_info"

puts "Generating Website..."

input_file = ARGV[0]
output_dir = ARGV[1]
puts "input_file: #{input_file}"
puts "output_dir: #{output_dir}"

input_file_contents = IO.read input_file
Parser
    .parse(input_file_contents)
    .each {|s| s.site_root = output_dir }
    .each {|s| Downloader.download s }
    .each {|s|
        output_file = s.filename_full_path
        output_contents = Formatter.format s

        output_file_dir = File.dirname output_file
        if not File.exists?(output_file_dir)
          puts "Creating directory #{output_file_dir}"
          Dir.mkdir(output_file_dir) 
        end

        puts "Writing file: #{output_file}"

        File.write(output_file, output_contents)
    }

puts "Generation Complete!"