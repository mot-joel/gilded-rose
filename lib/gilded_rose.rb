class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def normal_tick
    @days_remaining -= 1
    return if @quality <= 0
    @quality -= 1
    @quality -= 1 if @days_remaining < 4
  end

  def brie_tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end

  def backstage_tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
    @quality = 0 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end

  def tick
    case @name
    when 'Aged Brie'
      brie_tick
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_tick
    when 'Sulfuras, Hand of Ragnaros'
      return
    else
      normal_tick
    end
  end
end
