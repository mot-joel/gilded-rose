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
    if @days_remaining >= 4
      @quality -= 1
    else
      @quality -= 2
    end
  end

  def brie_tick
    @days_remaining -= 1
    if @days_remaining < 0
      @quality += 2
    else
      @quality += 1
    end
    return @quality = 50 if @quality >= 50
  end

  def backstage_tick
    @days_remaining -= 1
    if @days_remaining >= 10
      @quality += 1
    elsif @days_remaining < 10 && @days_remaining >= 5
      @quality += 2
    elsif @days_remaining < 5 && @days_remaining >= 0
      @quality += 3
    else
      @quality = 0
    end
    return @quality = 50 if @quality >= 50
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
