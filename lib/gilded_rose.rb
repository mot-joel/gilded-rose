class Item
  attr_reader :days_remaining, :quality

  def initialize(days_remaining, quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
  end
end

class Normal < Item
  def tick
    @days_remaining -= 1
    return if @quality <= 0
    @quality -= 1
    @quality -= 1 if @days_remaining < 4
  end
end

class Sulfuras < Item
  def tick
  end
end

class Backstage < Item
  def tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
    @quality = 0 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end
end

class Brie < Item
  def tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end
end

module GildedRose
  attr_reader :name

  def self.new(name, days_remaining, quality)
    Hash.new(Normal).merge(
      'Aged Brie' => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Sulfuras, Hand of Ragnaros' => Sulfuras
    )[name.to_s].new(days_remaining, quality)
  end
end
