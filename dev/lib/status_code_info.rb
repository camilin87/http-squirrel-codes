require "uri"

class StatusCodeInfo
    attr_accessor :code
    attr_accessor :description
    attr_accessor :url

    def initialize(code, description, url)
        @code = code
        @description = description
        @url = url
    end

    def full_name
        "#{@code} #{@description}"
    end

    def filename
        "#{code}.md"
    end

    def should_download_image
        not url.include? "i.imgur.com"
    end

    def image_filename
        if should_download_image
            img_extension = File.extname url
            img_filename = "#{code}"
            return "#{img_filename}#{img_extension}"
        end

        uri = URI.parse url
        return File.basename uri.path
    end

    def image_url
        if should_download_image
            return "/assets/img/code/#{image_filename}"
        end

        url
    end
end
