require 'parser'

describe Parser do
    def parse(input)
        Parser.parse input
    end

    it 'returns empty on invalid inputs' do
        expect(parse nil).to eq []
        expect(parse "").to eq []
        expect(parse " ").to eq []
    end

    it 'returns empty on incorrect inputs' do
        expect(parse "invalid").to eq []
        expect(parse "###100 - Continue").to eq []
    end

    it 'builds one image definition per valid line' do
        input = "![100 - Continue](http://i.imgur.com/mi9lcO6.jpg)  "

        info = parse(input)[0]

        expect(info).to be_kind_of StatusCodeInfo
        expect(info.code).to eq 100
        expect(info.description).to eq "Continue"
        expect(info.url).to eq "http://i.imgur.com/mi9lcO6.jpg"
    end
end