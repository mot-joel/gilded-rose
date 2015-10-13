require_relative 'test_helper'
require 'gilded_rose'

class TestGildedRose < Minitest::Test # :nodoc:
  def ticker(name, days_remaining, quality)
    item = GildedRose.new(name, days_remaining, quality)
    item.tick
    item
  end

  def test_normal_item_before_sell_date
    item = ticker('normal item', 5, 10)
    assert_equal(9, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_normal_item_on_sell_date
    item = ticker('normal item', 0, 10)
    assert_equal(8, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_normal_item_after_sell_date
    item = ticker('normal item', -10, 10)
    assert_equal(8, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_normal_item_of_zero_quality
    item = ticker('normal item', 5, 0)
    assert_equal(0, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_brie_before_sell_date
    item = ticker('Aged Brie', 5, 10)
    assert_equal(11, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_brie_with_max_quality
    item = ticker('Aged Brie', 5, 50)
    assert_equal(50, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_brie_on_sell_date
    item = ticker('Aged Brie', 0, 10)
    assert_equal(12, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_on_sell_date_near_max_quality
    item = ticker('Aged Brie', 0, 49)
    assert_equal(50, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_on_sell_date_with_max_quality
    item = ticker('Aged Brie', 0, 50)
    assert_equal(50, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_after_sell_date
    item = ticker('Aged Brie', -10, 10)
    assert_equal(12, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_brie_after_sell_date_with_max_quality
    item = ticker('Aged Brie', -10, 50)
    assert_equal(50, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_sulfuras_before_sell_date
    item = ticker('Sulfuras, Hand of Ragnaros', 5, 80)
    assert_equal(80, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_sulfuras_on_sell_date
    item = ticker('Sulfuras, Hand of Ragnaros', 0, 80)
    assert_equal(80, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_sulfuras_after_sell_date
    item = ticker('Sulfuras, Hand of Ragnaros', -10, 80)
    assert_equal(80, item.quality)
    assert_equal(-10, item.days_remaining)
  end

  def test_backstage_long_before_sell_date
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 11, 10)
    assert_equal(11, item.quality)
    assert_equal(10, item.days_remaining)
  end

  def test_backstage_long_before_sell_date_at_max_quality
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 11, 50)
    assert_equal(50, item.quality)
    assert_equal(10, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_upper_bound
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 10, 10)
    assert_equal(12, item.quality)
    assert_equal(9, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_upper_bound_at_max_quality
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 10, 50)
    assert_equal(50, item.quality)
    assert_equal(9, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_lower_bound
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 6, 10)
    assert_equal(12, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_backstage_medium_close_to_sell_date_lower_bound_at_max_quality
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 6, 50)
    assert_equal(50, item.quality)
    assert_equal(5, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_upper_bound
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 1, 10)
    assert_equal(13, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_backstage_very_close_to_sell_date_upper_bound_at_max_quality
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 1, 50)
    assert_equal(50, item.quality)
    assert_equal(0, item.days_remaining)
  end

  def test_backstage_on_sell_date
    item = ticker('Backstage passes to a TAFKAL80ETC concert', 0, 10)
    assert_equal(0, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_backstage_after_sell_date
    item = ticker('Backstage passes to a TAFKAL80ETC concert', -10, 10)
    assert_equal(0, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_before_sell_date
    skip
    item = ticker('Conjured Mana Cake', 5, 10)
    assert_equal(8, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_conjured_before_sell_date_at_zero_quality
    skip
    item = ticker('Conjured Mana Cake', 5, 0)
    assert_equal(0, item.quality)
    assert_equal(4, item.days_remaining)
  end

  def test_conjured_on_sell_date
    skip
    item = ticker('Conjured Mana Cake', 0, 10)
    assert_equal(6, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_on_sell_date_at_zero_quality
    skip
    item = ticker('Conjured Mana Cake', 0, 0)
    assert_equal(0, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_after_sell_date
    skip
    item = ticker('Conjured Mana Cake', -10, 10)
    assert_equal(6, item.quality)
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_after_sell_date_at_zero_quality
    skip
    item = ticker('Conjured Mana Cake', -10, 0)
    assert_equal(0, item.quality)
    assert_equal(-11, item.days_remaining)
  end
end
