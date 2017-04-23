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
        expect(parse(input)[0]).to be_kind_of(StatusCodeInfo)
    end
end