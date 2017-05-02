require "open-uri"

class Downloader
    def self.download(status_code_info)
        if not status_code_info.should_download_image
            return
        end

        puts "Downloading url: #{status_code_info.url}"
        open(status_code_info.image_full_path, "wb") do |file|
            file << open(status_code_info.url).read
        end
    end
end
