module CurrencyExceptions
  class DifferentCurrencyCodeError < StandardError
    def message
      "The given currency codes do not match."
    end
  end
end

class Currency
  attr_reader :amount, :curr_code
  def initialize(amount, curr_code)
    @amount = amount
    @curr_code = curr_code
  end

  def +(other)
    raise CurrencyExceptions::DifferentCurrencyCodeError unless other.is_a?(Fixnum) || other.is_a?(Currency)
    if other.is_a?(Fixnum)
      Currency.new(self.amount + other, self.curr_code)
    else
      Currency.new(self.amount + other.amount, self.curr_code)
    end
  end

  def -(other)
    raise CurrencyExceptions::DifferentCurrencyCodeError unless other.is_a?(Fixnum) || other.is_a?(Currency)
    if other.is_a?(Fixnum)
      Currency.new(self.amount - other)
    else
      Currency.new(self.amount - other.amount)
    end
  end

  def ==(other)
    raise CurrencyExceptions::DifferentCurrencyCodeError unless other.curr_code == self.curr_code
    self.amount == other.amount
  end

  def to_s
    "#{@amount}m" + "  " + "#{@curr_code}"
  end
end
