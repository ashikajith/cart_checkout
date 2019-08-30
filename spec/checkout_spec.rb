require_relative 'spec_helper'
require_relative '../lib/product'

describe 'Checkout cart' do

  let(:checkout) { Checkout.new(min_total: 60, discount: 10) }

  let(:discount_on_lavender) do
    ProductDiscount.new(code: '001', quantity: '2', amount: 8.50)
  end

  let(:lavender_heart) do
    Product.new(code: '001', name: 'Lavender heart', price: 9.25)
  end

  let(:personalised_cufflink) do
    Product.new(code: '002', name: 'Personalised cufflinks', price: 45)
  end

  let(:kids_t_shirt) do
    Product.new(code: '003', name: 'Kids T-shirt', price: 19.95)
  end

  it 'provide discount based on the promotion rule applied for grand total' do
    checkout.scan(lavender_heart)
    checkout.scan(personalised_cufflink)
    checkout.scan(kids_t_shirt)

    expect(checkout.total).to eq(66.78)
  end

  it 'provide discount on Lavender item if the quantity is more than 2' do
    checkout.scan(lavender_heart)
    checkout.scan(kids_t_shirt)
    checkout.scan(lavender_heart)
    checkout.apply_product_discount(discount_on_lavender)

    expect(checkout.total).to eq(36.95)
  end

  it 'provide discount on both grand total and items' do
    checkout.scan(lavender_heart)
    checkout.scan(personalised_cufflink)
    checkout.scan(lavender_heart)
    checkout.scan(kids_t_shirt)
    checkout.apply_product_discount(discount_on_lavender)

    expect(checkout.total).to eq(73.76)
  end

  it 'provide no discount' do
    checkout.scan(lavender_heart)
    checkout.scan(personalised_cufflink)

    expect(checkout.total).to eq(54.25)
  end
end
