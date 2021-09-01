

class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance 

  def initialize
    @balance = 0
  end
  
  def top_up(cash)
    fail "maximum exceeded: #{MAXIMUM_BALANCE}" if cash + @balance > MAXIMUM_BALANCE
    @balance += cash
  end 

end
