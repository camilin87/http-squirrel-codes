require 'parser'

describe Parser do
    it 'returns empty by default' do
        expect(Parser.parse "").to eq []
    end
end