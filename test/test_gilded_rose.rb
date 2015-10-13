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

  def test_nothing_changes
    @object = Item.new(5, 80)
    @object.tick
    assert_equal(80, @object.quality)
    assert_equal(5, @object.days_remaining)
  end
end

class TestNormal < Minitest::Test # :nodoc:
  include TestItemInterface

  def setup
    @object = Normal.new
  end

  def test_days_remaining_decreases_by_one
    @object = Normal.new(100, 3)
    @object.tick
    assert_equal(99, @object.days_remaining)
  end

  def test_before_sell_date
    @object = Normal.new(5, 10)
    @object.tick
    assert_equal(9, @object.quality)
  end

  def test_on_sell_date
    @object = Normal.new(0, 10)
    @object.tick
    assert_equal(8, @object.quality)
  end

  def test_after_sell_date
    @object = Normal.new(-10, 10)
    @object.tick
    assert_equal(8, @object.quality)
  end

  def test_zero_quality
    @object = Normal.new(10, 0)
    @object.tick
    assert_equal(0, @object.quality)
  end
end

class TestBrie < Minitest::Test
  include TestItemInterface

  def setup
    @object = Brie.new
  end

  def test_days_remaining_decreases_by_one
    @object = Brie.new(100, 3)
    @object.tick
    assert_equal(99, @object.days_remaining)
  end

  def test_quality_increases_before_sell_date
    @object = Brie.new(5, 10)
    @object.tick
    assert_equal(11, @object.quality)
  end

  def test_quality_never_exceeds_maximum
    @object = Brie.new(5, 50)
    @object.tick
    assert_equal(50, @object.quality)
  end

  def test_quality_caps_at_maximum
    @object = Brie.new(0, 49)
    @object.tick
    assert_equal(50, @object.quality)
  end

  def test_quality_increases_more_on_sell_date
    @object = Brie.new(0, 10)
    @object.tick
    assert_equal(12, @object.quality)
  end

  def test_quality_increases_more_after_sell_date
    @object = Brie.new(-10, 10)
    @object.tick
    assert_equal(12, @object.quality)
  end
end

class TestBackstage < Minitest::Test
  def setup
    @object = Backstage.new
  end

  def test_days_remaining_decreases_by_one
    @object = Backstage.new(100, 3)
    @object.tick
    assert_equal(99, @object.days_remaining)
  end

  def test_quality_never_exceeds_maximum
    @object = Backstage.new(5, 50)
    @object.tick
    assert_equal(50, @object.quality)
  end

  def test_quality_caps_at_maximum
    @object = Backstage.new(1, 49)
    @object.tick
    assert_equal(50, @object.quality)
  end

  def test_long_before_sell_date
    @object = Backstage.new(11, 10)
    @object.tick
    assert_equal(11, @object.quality)
  end

  def test_medium_close_to_sell_date_upper_bound
    @object = Backstage.new(10, 10)
    @object.tick
    assert_equal(12, @object.quality)
  end

  def test_medium_close_to_sell_date_lower_bound
    @object = Backstage.new(6, 10)
    @object.tick
    assert_equal(12, @object.quality)
  end

  def test_very_close_to_sell_date_upper_bound
    @object = Backstage.new(5, 10)
    @object.tick
    assert_equal(13, @object.quality)
  end

  def test_very_close_to_sell_date_lower_bound
    @object = Backstage.new(1, 10)
    @object.tick
    assert_equal(13, @object.quality)
  end

  def test_quality_drops_on_sell_date
    @object = Backstage.new(0, 10)
    @object.tick
    assert_equal(0, @object.quality)
  end

  def test_quality_drops_after_sell_date
    @object = Backstage.new(-10, 10)
    @object.tick
    assert_equal(0, @object.quality)
  end
end

class TestGildedRose < Minitest::Test # :nodoc:
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
