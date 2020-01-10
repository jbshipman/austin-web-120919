class BankAccount

  attr_writer :balance
  
  @@all = []

  def initialize
    @balance = 0
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balanced is $#{balance}."
  end

  def self.all
    @@all
  end

end

toms_acct = BankAccount.new
