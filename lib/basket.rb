class Basket
  def initialize(products:, delivery_rules:, offers: [])
    @catalogue = products.map { |p| [p.code, p] }.to_h
    @delivery_rules = delivery_rules.sort_by(&:threshold)
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalogue[product_code]
    raise ArgumentError, "Invalid product code #{product_code}" unless product

    @items << product
  end

  def total
    return 0.0 if @items.empty?
    
    subtotal = @items.sum(&:price)
    discount = @offers.sum { |offer| offer.apply(@items) }
    discounted_subtotal = [subtotal - discount, 0.0].max # To ensure discount doesn't make total negative
    delivery_charge = delivery_charge_for(discounted_subtotal)

    (discounted_subtotal + delivery_charge).round(2)
  end

  private

  def delivery_charge_for(amount)
    applicable = @delivery_rules.find { |rule| amount < rule.threshold }
    applicable ? applicable.cost : 0.0
  end
end
