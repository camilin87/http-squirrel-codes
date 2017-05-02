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

        input = StatusCodeInfo.new(203, "NA", "https://iruntheinternet.com/lulzdump/images/squirrel-stealing-chips-fries-food-1372895636K.jpg?id=")
        expect(input.should_download_image).to eq true
        expect(input.image_url).to eq "/assets/img/code/203.jpg"
        expect(input.image_filename).to eq "203.jpg"

        input = StatusCodeInfo.new(304, "NA", "http://media.gettyimages.com/photos/high-angle-view-of-squirrel-stretching-at-parco-del-valentino-picture-id593456375")
        expect(input.should_download_image).to eq true
        expect(input.image_url).to eq "/assets/img/code/304.jpg"
        expect(input.image_filename).to eq "304.jpg"
    end

    it "should not download the images from imgur" do
        input = StatusCodeInfo.new(725, "It works on my machine", "https://i.imgur.com/p767VEv.jpg")
        expect(input.should_download_image).to eq false
        expect(input.image_url).to eq "https://i.imgur.com/p767VEv.jpg"
        expect(input.image_filename).to eq "p767VEv.jpg"

        input = StatusCodeInfo.new(725, "It works on my machine", "https://i.imgur.com/p767VEv.jpg?id=")
        expect(input.should_download_image).to eq false
        expect(input.image_url).to eq "https://i.imgur.com/p767VEv.jpg?id="
        expect(input.image_filename).to eq "p767VEv.jpg"

        input = StatusCodeInfo.new(725, "It works on my machine", "https://i.imgur.com/p767VEv")
        expect(input.should_download_image).to eq false
        expect(input.image_url).to eq "https://i.imgur.com/p767VEv"
        expect(input.image_filename).to eq "p767VEv.jpg"
    end

    it "calculates the full paths of the files" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")
        input.site_root = "/var/tmp/"

        expect(StatusCodeInfo.pages_path "/var/tmp/").to eq "/var/tmp/_pages/"
        expect(input.filename_full_path).to eq "/var/tmp/_pages/725.md"
        expect(input.filename_full_path "/var/tmp1/").to eq "/var/tmp1/_pages/725.md"

        expect(StatusCodeInfo.images_path "/var/tmp/").to eq "/var/tmp/assets/img/code/"
        expect(input.image_full_path).to eq "/var/tmp/assets/img/code/725.png"
        expect(input.image_full_path "/var/tmp1/").to eq "/var/tmp1/assets/img/code/725.png"
    end

    it "blows up when no path has been specified" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")

        expect {input.filename_full_path}.to raise_error ArgumentError
        expect {input.image_full_path}.to raise_error ArgumentError
    end
end