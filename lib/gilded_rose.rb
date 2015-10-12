class GildedRose
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

def update_quality(items)
  backstage = 'Backstage passes to a TAFKAL80ETC concert'
  brie = 'Aged Brie'
  sulfuras = 'Sulfuras, Hand of Ragnaros'

  items.each do |item|
    if item.name != brie && item.name != backstage
      if item.quality > 0
        if item.name != sulfuras
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == backstage
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end
    if item.name != sulfuras
      item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != brie
        if item.name != backstage
          if item.quality > 0
            if item.name != sulfuras
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end
end
# DO NOT CHANGE THINGS BELOW -----------------------------------------

# Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
