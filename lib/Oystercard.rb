

class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance 
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey
  end
  
  def top_up(cash)
    fail "maximum exceeded: #{MAXIMUM_BALANCE}" if cash + @balance > MAXIMUM_BALANCE
    @balance += cash
  end 
   
  def deduct(cash)
    @balance -= cash
  end 

  def in_journey?
    @in_journey = false
  end

  def touch_in
     @in_journey = true 
  end

  def touch_out
    @in_journey = false
  end

end
