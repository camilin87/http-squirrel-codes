require "status_code_info"

describe StatusCodeInfo  do
    it "calculates properties correctly" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")

        expect(input.full_name).to eq "725 It works on my machine"
        expect(input.filename).to eq "725.md"
    end

    it "should download the images that are not from imgur" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")

        expect(input.should_download_image).to eq true
        expect(input.image_url).to eq "/assets/img/code/725.png"
        expect(input.image_filename).to eq "725.png"
    end

    it "should not download the images from imgur" do
        input = StatusCodeInfo.new(725, "It works on my machine", "https://i.imgur.com/p767VEv.jpg")

        expect(input.should_download_image).to eq false
        expect(input.image_url).to eq "https://i.imgur.com/p767VEv.jpg"
        expect(input.image_filename).to eq "p767VEv.jpg"
    end

    it "calculates the full paths of the files" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")
        site_root = "/var/tmp/"

        expect(StatusCodeInfo.pages_path site_root).to eq "/var/tmp/_pages/"
        expect(input.filename_full_path site_root).to eq "/var/tmp/_pages/725.md"

        expect(StatusCodeInfo.images_path site_root).to eq "/var/tmp/assets/img/code/"
        expect(input.image_full_path site_root).to eq "/var/tmp/assets/img/code/725.png"
    end
end