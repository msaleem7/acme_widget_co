# Acme Widget Co Sales System

Ruby shopping basket with products, delivery pricing and offers.

## Architecture

**Product** represents a widget with code name and price. 
**Basket** is the main shopping basket with add and total functionality. 
**DeliveryRule** defines delivery cost thresholds. 
**Offer** is the base class for promotional offers. 
**SecondHalfPriceOffer** implements the "buy one get second half price" logic.

The basket accepts arrays of products delivery rules and offers for easy configuration. Delivery rules are sorted by threshold for efficient lookup. The offer system is extensible through inheritance.

## Usage

```ruby
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket.add('B01')
basket.total # => 37.85
```

## Test Cases

- B01 G01 → $37.85
- R01 R01 → $54.37
- R01 G01 → $60.85  
- B01 B01 R01 R01 R01 → $98.27

Run: `ruby main.rb`
