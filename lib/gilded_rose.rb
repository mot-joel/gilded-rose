class Normal
  attr_reader :days_remaining, :quality

  def initialize(days_remaining, quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    return if @quality <= 0
    @quality -= 1
    @quality -= 1 if @days_remaining < 4
  end
end

class Sulfuras
  attr_reader :days_remaining, :quality

  def initialize(days_remaining, quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
  end
end

class Backstage
  attr_reader :days_remaining, :quality

  def initialize(days_remaining, quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
    @quality = 0 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end
end

class Brie
  attr_reader :days_remaining, :quality

  def initialize(days_remaining, quality)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining < 0
    @quality = 50 if @quality >= 50
  end
end

class GildedRose
  attr_reader :name

  def initialize(name, days_remaining, quality)
    @name = name
    @item = klass_for(name).new(days_remaining, quality)
  end

  def klass_for(name)
    Hash.new(Normal).merge(
      'Aged Brie' => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Sulfuras, Hand of Ragnaros' => Sulfuras
    )[name.to_s]
  end

  def quality
    @item.quality
  end

  def days_remaining
    @item.days_remaining
  end

  def tick
    @item.tick
  end
end
