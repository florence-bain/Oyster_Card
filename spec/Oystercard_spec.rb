require 'Oystercard'

describe Oystercard do
  it 'has a balance of 0 when initialised' do
    expect(subject.balance).to eq 0
  end

  it 'add money to card' do
    subject.top_up(1)
    expect(subject.balance).to eq 1
  end

  it 'prevents adding more than the limit to the balance' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error "maximum exceeded: #{maximum_balance}"
  end
  
  describe 'journey balance' do 
  let(:station){ double :station}
  let(:exit_station) { double :station }
    before(:each) do
      subject = Oystercard.new
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end 

      it 'deducts from the balance' do 
        expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
      end   

      it 'can touch in' do
        subject.top_up(Oystercard::MAXIMUM_BALANCE)
        expect(subject.in_journey)
      end

      it 'has a minimum balance' do
        expect{ subject.touch_in(station) }.to raise_error "You do not have enough to travel"
      end 

      it 'touch_out' do
        subject.touch_out(exit_station)
        expect(subject.in_journey)
      end 
  end

  describe 'stores the entry and exit' do 
    context 'journey' do
    let(:station){ double :station}
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

      it 'stores entry station' do
        subject.top_up(Oystercard::MAXIMUM_BALANCE)
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
      end 

      it 'stores exit station' do 
        subject.top_up(Oystercard::MAXIMUM_BALANCE)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
      end 

      it 'stores empty list of stations by default' do 
        expect(subject.journeys).to be_empty
      end 

      it 'stores a journey' do
        subject.top_up(Oystercard::MAXIMUM_BALANCE)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.journeys).to include journey
      end 
    end 
  end 

end 

