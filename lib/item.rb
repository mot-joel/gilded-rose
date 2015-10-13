class Item
  attr_reader :days_remaining, :quality

  def initialize(days_remaining = nil, quality = nil)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
  end
end
