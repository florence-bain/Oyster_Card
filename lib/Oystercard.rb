

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @entry_station
    @exit_station
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

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
    @in_journey = false
    @exit_station = station
  end

  private 

  '#deduct'
  
end
