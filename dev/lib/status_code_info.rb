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

    def image_url
        if should_download_image
            img_extension = File.extname(url)
            return "/assets/img/code/#{code}#{img_extension}"
        end

        url
    end
end
