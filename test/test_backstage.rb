require_relative 'test_helper'
require_relative 'item_interface'

class TestBackstage < Minitest::Test # :nodoc:
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
