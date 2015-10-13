require_relative 'test_helper'
require 'gilded_rose'

module TestItemInterface # :nodoc:
  def test_responds_to_days_remaining
    assert_respond_to(@object, :days_remaining)
  end

  def test_responds_to_quality
    assert_respond_to(@object, :quality)
  end

  def test_responds_to_tick
    assert_respond_to(@object, :tick)
  end
end

class TestItem < Minitest::Test # :nodoc:
  include TestItemInterface

  def setup
    @object = Item.new
  end
end

class TestNormal < Minitest::Test # :nodoc:
  include TestItemInterface

  def setup
    @object = Normal.new
  end

  def test_before_sell_date
    @object = Normal.new(5, 10)
    @object.tick
    assert_equal(9, @object.quality)
    assert_equal(4, @object.days_remaining)
  end

  def test_on_sell_date
    @object = Normal.new(0, 10)
    @object.tick
    assert_equal(8, @object.quality)
    assert_equal(-1, @object.days_remaining)
  end

  def test_after_sell_date
    @object = Normal.new(-10, 10)
    @object.tick
    assert_equal(8, @object.quality)
    assert_equal(-11, @object.days_remaining)
  end

  def test_zero_quality
    @object = Normal.new(10, 0)
    @object.tick
    assert_equal(0, @object.quality)
  end
end

class TestGildedRose < Minitest::Test # :nodoc:
  def test_brie_before_sell_date
    item = GildedRose.new('Aged Brie', 5, 10)
    item.tick
    assert_equal(11, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_brie_with_max_quality
    item = GildedRose.new('Aged Brie', 5, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_brie_on_sell_date
    item = GildedRose.new('Aged Brie', 0, 10)
    item.tick
    assert_equal(12, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_on_sell_date_near_max_quality
    item = GildedRose.new('Aged Brie', 0, 49)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_on_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 0, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_after_sell_date
    item = GildedRose.new('Aged Brie', -10, 10)
    item.tick
    assert_equal(12, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_brie_after_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', -10, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_sulfuras_before_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 5, 80)
    item.tick
    assert_equal(80, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_sulfuras_on_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 0, 80)
    item.tick
    assert_equal(80, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_sulfuras_after_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', -10, 80)
    item.tick
    assert_equal(80, item.quality)
    assert_equal(-10, item.days_remaining)
  end

  def test_backstage_long_before_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 11, 10)
    item.tick
    assert_equal(11, item.quality)
    assert_equal(10, item.days_remaining)
  end

  def test_backstage_long_before_sell_date_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 11, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(10, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
    item.tick
    assert_equal(12, item.quality)
    assert_equal(9, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(9, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 6, 10)
    item.tick
    assert_equal(12, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 6, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)
    item.tick
    assert_equal(13, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 5, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 1, 10)
    item.tick
    assert_equal(13, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 1, 50)
    item.tick
    assert_equal(50, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_backstage_on_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)
    item.tick
    assert_equal(0, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_backstage_after_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', -10, 10)
    item.tick
    assert_equal(0, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_before_sell_date
    item = GildedRose.new('Conjured Mana Cake', 5, 10)
    item.tick
    assert_equal(8, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_conjured_before_sell_date_at_zero_quality
    item = GildedRose.new('Conjured Mana Cake', 5, 0)
    item.tick
    assert_equal(0, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_conjured_on_sell_date
    item = GildedRose.new('Conjured Mana Cake', 0, 10)
    item.tick
    assert_equal(6, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_on_sell_date_at_zero_quality
    item = GildedRose.new('Conjured Mana Cake', 0, 0)
    item.tick
    assert_equal(0, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_after_sell_date
    item = GildedRose.new('Conjured Mana Cake', -10, 10)
    item.tick
    assert_equal(6, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_after_sell_date_at_zero_quality
    item = GildedRose.new('Conjured Mana Cake', -10, 0)
    item.tick
    assert_equal(0, item.quality)
    assert_equal(-11, item.days_remaining)
  end
end
