require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency'

class CurrencyTest < MiniTest::Test

  def test_currency_exists
    assert Currency.new(15, "USD")
  end

  def test_variable_placement
    testee_1 = Currency.new(25, "JPY")
    testee_2 = Currency.new(55, "EUR")
    testee_3 = Currency.new(125, "USD")

    assert_equal 25, testee_1.amount
    assert_equal "EUR", testee_2.curr_code
    assert_equal 125, testee_3.amount
  end

  def test_equality
    testee_1 = Currency.new(35, :USD)
    testee_2 = Currency.new(35, :EUR)
    testee_3 = Currency.new(35, :USD)

    assert_equal testee_1, testee_3
    exception = assert_raises(CurrencyExceptions::DifferentCurrencyCodeError) do
      testee_1 == testee_2
    end
    assert_match(/given currency/, exception.message)

  end

  # def test_addition
  #   testee_1 = Currency.new(25, "USD")
  #   testee_2 = Currency.new(55, "USD")
  #
  #   assert_equal 80, testee_1.amount + 55
  # end

end
