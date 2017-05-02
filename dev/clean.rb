require "fileutils"
require_relative "lib/status_code_info"

puts "Cleaning Generated Files..."

output_dir = ARGV[0]
puts "output_dir: #{output_dir}"

def cleanup_folder(folder_path)
    puts "Cleaning up #{folder_path}"
    `rm -Rf #{folder_path}`
    FileUtils.mkdir_p folder_path
end

[
    StatusCodeInfo.pages_path(output_dir),
    StatusCodeInfo.images_path(output_dir)
].each do |folder_path|
    cleanup_folder folder_path
end

puts "Cleanup Complete!"