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
  
describe '#top_up_required' do 
  before(:each) do
    subject = Oystercard.new
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
  end 

  it 'deducts from the balance' do 
    expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
  end   

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
 
  it 'can touch in' do
    subject.top_up(5)
    subject.touch_in
    subject.in_journey
    expect(subject.in_journey).to eq true
  end

  it 'has a minimum balance' do
    expect{ subject.touch_in }.to raise_error "You do not have enough to travel"
  end 
end 

describe '#touch_out' do
  subject = Oystercard.new
  subject.top_up(5)
  subject.touch_in
  it 'takes a minimum charge from the balance' do 
  expect{subject.touch_out}.to change{ subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
  subject.touch_out
    expect(subject.in_journey).to eq false
  end 
end 

end 
