class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == 'Aged Brie'
      @days_remaining -= 1
      if @days_remaining < 0
        @quality += 2
      else
        @quality += 1
      end
      return @quality = 50 if @quality >= 50
      return
    end
    if @name == 'Backstage passes to a TAFKAL80ETC concert'
      @days_remaining -= 1
      if @days_remaining >= 10
        @quality += 1
      elsif @days_remaining < 10 && @days_remaining > 0
        @quality += 2
      elsif @days_remaining == 0
        @quality += 3
      else @quality = 0
      end
      return @quality = 50 if @quality >= 50
      return
    end
    if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality -= 1
        end
      end
    else
      if @quality < 50
        @quality += 1
        if @name == 'Backstage passes to a TAFKAL80ETC concert'
          if @days_remaining < 11
            if @quality < 50
              @quality += 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if @name != 'Sulfuras, Hand of Ragnaros'
      @days_remaining -= 1
    end
    if @days_remaining < 0
      if @name != 'Aged Brie'
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality -= 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality += 1
        end
      end
    end
  end
end
