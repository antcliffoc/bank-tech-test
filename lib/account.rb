class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement.unshift("#{Time.now.strftime('%d/%m/%Y')} || #{'%.2f' % amount} || || #{'%.2f' % @balance}")
  end

  def withdraw(amount)
    @balance -= amount
    @statement.unshift("#{Time.now.strftime('%d/%m/%Y')} || || #{'%.2f' % amount} || #{'%.2f' % @balance}")
  end

  def print_statement
    p "date || credit || debit || balance"
    @statement.each { |event| p event }
  end


end
