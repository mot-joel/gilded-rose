require_relative 'test_helper'
require_relative 'item_interface'

class TestBrie < Minitest::Test # :nodoc:
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
