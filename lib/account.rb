class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    add_event(deposit_amount: amount)
  end

  def withdraw(amount)
    @balance -= amount
    add_event(withdrawal_amount: amount)
  end

  def print_statement
    p "date || credit || debit || balance"
    @statement.each { |event| p event }
  end

  private

  def add_event(deposit_amount: nil, withdrawal_amount: nil)
    if (deposit_amount)
      @statement.unshift("#{Time.now.strftime('%d/%m/%Y')} || #{'%.2f' % deposit_amount} || || #{'%.2f' % @balance}")
    elsif (withdrawal_amount)
      @statement.unshift("#{Time.now.strftime('%d/%m/%Y')} || || #{'%.2f' % withdrawal_amount} || #{'%.2f' % @balance}")
    end
  end

end
