require "uri"

class StatusCodeInfo
    attr_accessor :code
    attr_accessor :description
    attr_accessor :url
    attr_accessor :site_root

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

    def filename_from_url(url)
        uri = URI.parse url
        return File.basename uri.path
    end

    def image_filename
        img_filename = "#{code}"
        filename = filename_from_url url
        img_extension = File.extname filename

        if img_extension.length == 0
            img_extension = ".jpg"
        end

        if not should_download_image
            img_filename = File.basename(filename, File.extname(filename))
        end

        "#{img_filename}#{img_extension}"
    end

    def image_url
        if should_download_image
            return "/assets/img/code/#{image_filename}"
        end

        url
    end

    def self.pages_path(output_dir)
        File.join(output_dir, "_pages/")
    end

    def self.images_path(output_dir)
        File.join(output_dir, "assets/img/code/")
    end

    def standardize_output_path(output_dir)
        result = output_dir

        if not output_dir
            result = @site_root
        end

        if not result
            raise ArgumentError, "No output path defined"
        end

        result
    end

    def filename_full_path(output_dir=nil)
        output_base_path = standardize_output_path output_dir
        pages_path = StatusCodeInfo.pages_path output_base_path
        File.join(pages_path, filename)
    end

    def image_full_path(output_dir=nil)
        output_base_path = standardize_output_path output_dir
        images_path = StatusCodeInfo.images_path output_base_path
        File.join(images_path, image_filename)
    end
end
