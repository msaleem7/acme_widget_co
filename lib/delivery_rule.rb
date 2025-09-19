class DeliveryRule
  attr_reader :threshold, :cost

  def initialize(threshold, cost)
    @threshold = threshold
    @cost = cost
  end
end
