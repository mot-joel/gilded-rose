require_relative 'test_helper'
require_relative 'item_interface'

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
