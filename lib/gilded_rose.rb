require 'item'

class GildedRose
  attr_reader :name, :days_remaining, :quality

  CONFIGS = {
    'Aged Brie': {
      retained_quality: true,
      gains_quality: true,
      continuous_quality: true
    },
    'Backstage passes to a TAFKAL80ETC concert': {
      retained_quality: true,
      gains_quality: true,
      accelerating_quality: true,
      hard_expiration: true
    },
    "Sulfuras, Hand of Ragnaros": {
      retained_quality: true,
      eternal: true
    }
  }

  # RETAINED_QUALITY = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']
  # GAIN_QUALITY = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert']
  # GAIN_QUALITY_AS_NEAR = ['Backstage passes to a TAFKAL80ETC concert']
  # BETTER_WITH_AGE = ['Aged Brie']
  # WORTHLESS_WITH_AGE = ['Backstage passes to a TAFKAL80ETC concert']
  # ETERNAL = ['Sulfuras, Hand of Ragnaros']

  def initialize(name, days_remaining, quality)
    @name = name
    @days_remaining = days_remaining
    @quality = quality

    @item = Item.new( CONFIGS[@name] )
  end

  def tick
    #if @name 

    decrement_quality 

    increment_quality if @item.config[:gains_quality]
    increment_quality if @days_remaining < 11 and @item.config[:accelerating_quality]
    increment_quality if @days_remaining < 6 and @item.config[:accelerating_quality]
    
    decrement_remaining

    if @days_remaining < 0
      increment_quality if @item.config[:continuous_quality]
      destroy_quality if @item.config[:hard_expiration]
      decrement_quality 
    end
  end

  def destroy_quality
    @qualit = 0
  end

  def decrement_quality
    @quality -= 1 if @quality > 0 and not @item.config[:retained_quality]
  end

  def increment_quality
    @quality += 1 if quality < 50 
  end

  def decrement_remaining
    @days_remaining -= 1 unless @item.config[:eternal]
  end
end
