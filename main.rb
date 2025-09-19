require_relative 'lib/product'
require_relative 'lib/basket'
require_relative 'lib/delivery_rule'
require_relative 'lib/second_half_price_offer'

products = [
  Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
  Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
  Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
]

delivery_rules = [
  DeliveryRule.new(50, 4.95),
  DeliveryRule.new(90, 2.95)
]

offers = [
  SecondHalfPriceOffer.new('R01')
]

# Test cases from requirements
puts "Testing Acme Widget Co Sales System"
puts "=" * 40

# Test case 1: B01, G01 => $37.85
basket1 = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket1.add('B01')
basket1.add('G01')
puts "B01, G01: $#{basket1.total} (expected: $37.85)"

# Test case 2: R01, R01 => $54.37
basket2 = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket2.add('R01')
basket2.add('R01')
puts "R01, R01: $#{basket2.total} (expected: $54.37)"

# Test case 3: R01, G01 => $60.85
basket3 = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket3.add('R01')
basket3.add('G01')
puts "R01, G01: $#{basket3.total} (expected: $60.85)"

# Test case 4: B01, B01, R01, R01, R01 => $98.27
basket4 = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket4.add('B01')
basket4.add('B01')
basket4.add('R01')
basket4.add('R01')
basket4.add('R01')
puts "B01, B01, R01, R01, R01: $#{basket4.total} (expected: $98.27)"
