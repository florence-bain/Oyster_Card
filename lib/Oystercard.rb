

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @entry_station
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
    !!entry_station
  end

  def touch_in(station)
    fail "You do not have enough to travel" if @balance < MINIMUM_BALANCE
     @in_journey = true
     @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  private 

  '#deduct'
  
end
