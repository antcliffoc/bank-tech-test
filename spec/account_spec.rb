require 'account'

describe Account do
  it "has a balance" do
    expect(subject).to respond_to(:balance)
  end

  describe "#deposit" do
    it "increases the balance by amount given" do
      expect{subject.deposit(40)}.to change{subject.balance}.by(40)
    end
  end

  describe "#withdraw" do
    it "decreases the balance by amount given" do
      expect{subject.withdraw(40)}.to change{subject.balance}.by(-40)
    end
  end

  describe "#print_statement" do
    it "prints a header" do
      header = "\"date || credit || debit || balance\"\n"
      expect{subject.print_statement}.to output(header).to_stdout
    end

    it "prints a statment of deposits and withdrawels with newest at the top" do
      deposit_amount = 600
      subject.deposit(deposit_amount)
      withdrawal_amount = 20.89
      subject.withdraw(withdrawal_amount)
      expected_statement ="\"date || credit || debit || balance\"\n\"#{Time.now.strftime('%d/%m/%Y')} || || #{withdrawal_amount} || 579.11\"\n\"#{Time.now.strftime('%d/%m/%Y')} || #{deposit_amount}.00 || || 600.00\"\n"
      expect{subject.print_statement}.to output(expected_statement).to_stdout
    end
  end

end
