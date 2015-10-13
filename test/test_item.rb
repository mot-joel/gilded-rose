require_relative 'test_helper'
require_relative 'item_interface'

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
