require_relative 'offer'

class SecondHalfPriceOffer < Offer
  def initialize(product_code)
    @product_code = product_code
  end

  def apply(items)
    return 0.0 if items.empty?
    
    eligible_items = items.select { |i| i.code == @product_code }
    return 0.0 if eligible_items.empty?
    
    count = eligible_items.size
    return 0.0 if count < 2

    ((count / 2) * (eligible_items.first.price * 0.5)).round(2)
  end
end
