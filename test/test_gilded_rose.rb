require_relative 'test_helper'
require 'gilded_rose'

class TestGildedRose < Minitest::Test # :nodoc:
  {
    'Aged Brie' => Brie,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Sulfuras, Hand of Ragnaros' => Item,
    'Conjured Mana Cake' => Conjured
  }.each do |k, v|
    define_method "test_makes_#{v.to_s.downcase}" do
      @object = GildedRose.new(k)
      assert_kind_of(v, @object)
    end
  end

  def test_defaults_to_normal
    @object = GildedRose.new('normal thingy')
    assert_kind_of(Normal, @object)
  end
end
