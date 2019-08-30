# The class is specific to the product quantity disocunt, the sub total discount
# will be created as a separate class
class TotalPriceDiscount
  attr_accessor :min_total, :discount

  def initialize(promo_rules)
    @min_total = promo_rules[:min_total]
    @discount = promo_rules[:discount]
  end

  def apply_promo(total_amount)
    # Apply percentage discount
    return 0 unless total_amount > min_total
    total_amount * discount / 100
  end
end
