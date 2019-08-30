# Class to provide discount for individual product
class ProductDiscount
  attr_accessor :code, :quantity, :amount

  def initialize(args)
    @code = args[:code]
    @quantity = args[:quantity]
    @amount = args[:amount]
  end
end
