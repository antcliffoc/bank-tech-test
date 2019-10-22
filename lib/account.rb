class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @activity = []
  end

  def deposit(amount)
    @balance += amount
    add_event(deposit_amount: amount)
    return "£#{format_money(amount)} has been added to your account"
  end

  def withdraw(amount)
    check_funds(amount)
    @balance -= amount
    add_event(withdrawal_amount: amount)
    return "£#{format_money(amount)} has been withdrawn from your account"
  end

  def print_statement
    p "date || credit || debit || balance"
    @activity.each { |event| p event }
    return "Thank you for banking with us!"
  end

  private

  def add_event(deposit_amount: nil, withdrawal_amount: nil)
    if (deposit_amount)
      @activity.unshift("#{Time.now.strftime('%d/%m/%Y')} || #{format_money(deposit_amount)} || || #{'%.2f' % @balance}")
    elsif (withdrawal_amount)
      @activity.unshift("#{Time.now.strftime('%d/%m/%Y')} || || #{format_money(withdrawal_amount)} || #{'%.2f' % @balance}")
    end
  end

  def format_money(amount)
    "#{'%.2f' % amount}"
  end

  def check_funds(amount)
    raise "Insufficient Funds" if (@balance - amount) < 0
  end
end
