class GildedRose
  attr_reader :name, :days_remaining, :quality

  RETAINED_QUALITY = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']
  GAIN_QUALITY = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert']
  GAIN_QUALITY_AS_NEAR = ['Backstage passes to a TAFKAL80ETC concert']
  BETTER_WITH_AGE = ['Aged Brie']
  WORTHLESS_WITH_AGE = ['Backstage passes to a TAFKAL80ETC concert']
  ETERNAL = ['Sulfuras, Hand of Ragnaros']

  def initialize(name, days_remaining, quality)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    #if @name 

    decrement_quality

    increment_quality if GAIN_QUALITY.include? @name
    increment_quality if @days_remaining < 11 and GAIN_QUALITY_AS_NEAR.include? @name
    increment_quality if @days_remaining < 6 and GAIN_QUALITY_AS_NEAR.include? @name
    
    decrement_remaining

    if @days_remaining < 0
      increment_quality if BETTER_WITH_AGE.include? @name
      @quality = 0 if WORTHLESS_WITH_AGE.include? @name
      decrement_quality 
      #if @name != 'Aged Brie'
        # if @name != 'Backstage passes to a TAFKAL80ETC concert'
          # if @quality > 0
          #   if @name != 'Sulfuras, Hand of Ragnaros'
          #     @quality -= 1
          #   end
          # end
        # else
          # @quality = @quality - @quality
        # end
      #else
        # if @quality < 50
        #   @quality += 1
        # end
      #end
    end
  end

  def decrement_quality
    @quality -= 1 if @quality > 0 and not RETAINED_QUALITY.include? @name
  end

  def increment_quality
    @quality += 1 if quality < 50
  end

  def decrement_remaining
    @days_remaining -= 1 unless ETERNAL.include? @name
  end
end
