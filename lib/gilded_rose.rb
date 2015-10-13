require_relative 'item'
require_relative 'normal'
require_relative 'backstage'
require_relative 'brie'
require_relative 'conjured'

module GildedRose
  def self.new(name, days_remaining = nil, quality = nil)
    Hash.new(Normal).merge(
      'Aged Brie' => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Sulfuras, Hand of Ragnaros' => Item,
      'Conjured Mana Cake' => Conjured
    )[name.to_s].new(days_remaining, quality)
  end
end
