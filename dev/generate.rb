require_relative "lib/formatter"
require_relative "lib/parser"
require_relative "lib/status_code_info"

puts "Generating Website..."

input_file = ARGV[0]
output_dir = ARGV[1]
puts "input_file: #{input_file}"
puts "output_dir: #{output_dir}"

input_file_contents = IO.read input_file
Parser
    .parse(input_file_contents)
    .each {|s|
        output_file = File.join(output_dir, s.filename)
        output_contents = Formatter.format s

        puts "Writing file: #{output_file}"

        File.write(output_file, output_contents)
    }

puts "Generation Complete!"