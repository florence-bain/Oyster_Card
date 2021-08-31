class Oystercard

  attr_reader :balance 

  def initialize
    @balance = 0
  end
  
  def top_up(cash)
    raise 'maximum exceeded' if @balance + cash >= 90
    @balance += cash
  end 

end
