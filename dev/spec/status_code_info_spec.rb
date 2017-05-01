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
    end

    it "should not download the images from imgur" do
        input = StatusCodeInfo.new(725, "It works on my machine", "https://i.imgur.com/p767VEv.jpg")

        expect(input.should_download_image).to eq false
    end
end