# The class is specific to the product quantity disocunt, the sub total discount
# will be created as a separate class
class TotalPriceDiscount
  attr_reader :min_quantity, :discount

  def initialize(promo_rules)
    @min_amount = promo_rules[:min_amount]
    @discount = promo_rules[:discount]
  end

  def apply_promo(cart)
    # Apply percentage
    if cart.total > min_amount

    end
  end
end
