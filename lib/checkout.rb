# The class will scan the number of items and provide the total amount based on
# the promotional rules applied for the particular object
class Checkout
  attr_reader :cart

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @cart = []
  end

  def scan(item)
    @cart << item
  end

  def total
    @promotional_rules.each do |promo|
      promo.apply(basker)
    end
    cart.reduce(0) { |sum, product| sum + product.price.to_f }
  end
end
