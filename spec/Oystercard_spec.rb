require 'Oystercard'

describe Oystercard do
  it 'has a balance of 0 when initialised' do
    expect(subject.balance).to eq 0
  end

  it 'add money to card' do
    subject.top_up(1)
    expect(subject.balance).to eq 1
  end
end 