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

  it 'deducts from the balance' do 
    subject.top_up(20)
    expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
  end 

  it{is_expected.to respond_to(:touch_in)}
  it{is_expected.to respond_to(:touch_out)}

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  
 
  it 'can touch in' do
    subject.touch_in
    expect(subject.in_journey).to eq true 
  end

  it 'can touch out' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq false
  end



end 
