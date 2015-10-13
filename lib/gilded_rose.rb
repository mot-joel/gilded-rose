require 'item'

class GildedRose
  attr_reader :name, :days_remaining, :quality

  CONFIGS = {
    :'Aged Brie' => {
      retained_quality: true,
      gains_quality: true,
      continuous_quality: true
    },
    :'Backstage passes to a TAFKAL80ETC concert' => {
      retained_quality: true,
      gains_quality: true,
      accelerating_quality: true,
      hard_expiration: true
    },
    :"Sulfuras, Hand of Ragnaros" => {
      retained_quality: true,
      eternal: true
    },
    :"Conjured Mana Cake" => {
      half_on_expiration: true,
      decrement_if_new: true,
      continuous_quality: true
    }
  }

  def initialize(name, days_remaining, quality)
    @name = name
    @days_remaining = days_remaining
    @quality = quality

    @item = Item.new( CONFIGS[@name.to_sym] || {} )
  end

  def tick
    #if @name
    half if @item.config[:half_on_expiration]
      
    decrement_quality 
    decrement_quality if @days_remaining > 0 and @item.config[:decrement_if_new]

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
    @quality = 0
  end

  def decrement_quality
    @quality -= 1 if @quality > 0 and not @item.config[:retained_quality] || (@item.config[:decrement_if_new] and @days_remaining <= 0)
  end

  def increment_quality
    @quality += 1 if quality < 50 and not @quality <= 0
  end

  def decrement_remaining
    @days_remaining -= 1 unless @item.config[:eternal]
  end

  def half
    @quality = @quality >> 1 if @days_remaining <= 0
  end
end
