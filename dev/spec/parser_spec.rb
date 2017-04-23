require "status_code_info"
require "parser"

describe Parser do
    def parse(input)
        Parser.parse input
    end

    it "returns empty on invalid inputs" do
        expect(parse nil).to eq []
        expect(parse "").to eq []
        expect(parse " ").to eq []
    end

    it "returns empty on incorrect inputs" do
        expect(parse "invalid").to eq []
        expect(parse "###100 - Continue").to eq []
    end

    it "builds one image definition per valid line" do
        input = "![100 - Continue](http://i.imgur.com/mi9lcO6.jpg)  "

        info = parse(input)[0]

        expect(info).to be_kind_of StatusCodeInfo
        expect(info.code).to eq 100
        expect(info.description).to eq "Continue"
        expect(info.url).to eq "http://i.imgur.com/mi9lcO6.jpg"
    end

    it "parses an entire file" do 
        input = %{
###101 - Switching Protocols
![101 - Switching Protocols](http://i.imgur.com/p767VEv.jpg)  

## 2xx  

###200 - OK
![200 - OK](http://i.imgur.com/HXotKm9.jpg)  
}
        result = parse(input)

        expect(result.length).to eq 2

        expect(result[0]).to be_kind_of StatusCodeInfo
        expect(result[0].code).to eq 101
        expect(result[0].description).to eq "Switching Protocols"
        expect(result[0].url).to eq "http://i.imgur.com/p767VEv.jpg"

        expect(result[1]).to be_kind_of StatusCodeInfo
        expect(result[1].code).to eq 200
        expect(result[1].description).to eq "OK"
        expect(result[1].url).to eq "http://i.imgur.com/HXotKm9.jpg"
    end
end