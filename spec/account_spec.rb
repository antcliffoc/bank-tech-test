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

end
