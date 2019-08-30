# The class will scan the number of items and provide the total amount based on
# the promotional rules applied for the particular object
class Checkout
  attr_reader :cart

  def initialize(promotion_rules)
    @promotion_rules = TotalPriceDiscount.new(promotion_rules)
    @cart = []
  end

  def scan(product)
    @cart << product
  end

  def apply_product_discount(product_discount)
    product_count = @cart.count { |product| product.code.include?(product_discount.code) }
    return @cart unless product_count >= product_discount.quantity.to_i
    @cart.select { |product| product.code == product_discount.code }.map { |ele| ele.price=product_discount.amount}
    @cart
  end

  def total
    grand_total = cart.reduce(0) { |sum, product| sum + product.price.to_f }
    (grand_total - @promotion_rules.apply_promo(grand_total)).round(2)
  end
end
