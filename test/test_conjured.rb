require_relative 'test_helper'
require_relative 'item_interface'

class TestConjured < Minitest::Test # :nodoc:
  def setup
    @object = Conjured.new
  end

  def test_days_remaining_decreases_by_one
    @object = Conjured.new(100, 3)
    @object.tick
    assert_equal(99, @object.days_remaining)
  end

  def test_quality_caps_at_minimum
    @object = Conjured.new(0, 1)
    @object.tick
    assert_equal(0, @object.quality)
  end

  def test_conjured_before_sell_date
    @object = Conjured.new(5, 10)
    @object.tick
    assert_equal(8, @object.quality)
  end

  def test_conjured_on_sell_date
    @object = Conjured.new(0, 10)
    @object.tick
    assert_equal(6, @object.quality)
  end

  def test_conjured_after_sell_date
    @object = Conjured.new(-10, 10)
    @object.tick
    assert_equal(6, @object.quality)
  end
end
