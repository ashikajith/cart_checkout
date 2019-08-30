# lajsdnkjsakd
class Product
  attr_accessor :code, :name, :price

  def intialize(product_hash)
    @code = product_hash[:code]
    @name = product_hash[:name]
    @price = product_hash[:price]
  end

  def self.load_products
    Product.new(
      { code: '001', name: 'Lavender Heart', price: '9.25' },
      { code: '002', name: 'Personalised Cufflinks', price: '45.00' },
      { code: '003', name: 'Kids T-Shirt', price: '19.95' })
  end
end
