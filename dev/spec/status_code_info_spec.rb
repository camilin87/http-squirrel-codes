require "status_code_info"

describe StatusCodeInfo  do
    it "calculates properties correctly" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")

        expect(input.full_name).to eq "725 - It works on my machine"
        expect(input.filename).to eq "725.md"
    end
end