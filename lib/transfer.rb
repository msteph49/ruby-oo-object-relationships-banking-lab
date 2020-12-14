class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    # @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  def execute_transaction
    if @sender.balance < @amount || valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end

