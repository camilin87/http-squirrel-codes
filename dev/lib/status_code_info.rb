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
end
