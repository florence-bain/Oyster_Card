require 'Oystercard'

describe Oystercard do
  it 'has a balance of 0 when initialised' do
    expect(subject.balance).to eq 0
  end
end 