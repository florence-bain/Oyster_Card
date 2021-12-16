require 'Station'

describe Station do 
let(:station) { Station.new("Bank", 1) }

    it 'shows station name' do 
        expect(station.name).to eq("Bank")
    end 

    it 'shows station zone' do 
        expect(station.zone).to eq 1
    end 
end 