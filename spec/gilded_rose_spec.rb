require 'rspec/given'
require 'gilded_rose'

RSpec.describe GildedRose do
  context '#tick' do
    Given(:days_remaining) { 5 }
    Given(:quality) { 10 }
    Given(:item) { described_class.new(name, days_remaining, quality) }

    When { item.tick }

    context 'normal item' do
      Given(:name) { 'NORMAL ITEM' }

      Invariant { expect(item.days_remaining).to eq(days_remaining - 1) }

      context 'before sell date' do
        Then { expect(item.quality).to eq(quality - 1) }
      end

      context 'on sell date' do
        Given(:days_remaining) { 0 }
        Then { expect(item.quality).to eq(quality - 2) }
      end

      context 'after sell date' do
        Given(:days_remaining) { -10 }
        Then { expect(item.quality).to eq(quality - 2) }
      end

      context 'of zero quality' do
        Given(:quality) { 0 }
        Then { expect(item.quality).to eq(0) }
      end
    end

    context 'Aged Brie' do
      Given(:name) { 'Aged Brie' }

      Invariant { expect(item.days_remaining).to eq(days_remaining - 1) }

      context 'before sell date' do
        Then { expect(item.quality).to eq(quality + 1) }

        context 'with max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'on sell date' do
        Given(:days_remaining) { 0 }
        Then { expect(item.quality).to eq(quality + 2) }

        context 'near max quality' do
          Given(:quality) { 49 }
          Then { expect(item.quality).to eq(50) }
        end

        context 'with max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'after sell date' do
        Given(:days_remaining) { -10 }
        Then { expect(item.quality).to eq(quality + 2) }

        context 'with max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end
    end

    context 'Sulfuras' do
      Given(:quality) { 80 }
      Given(:name) { 'Sulfuras, Hand of Ragnaros' }

      Invariant { expect(item.days_remaining).to eq(days_remaining) }

      context 'before sell date' do
        Then { expect(item.quality).to eq(quality) }
      end

      context 'on sell date' do
        Given(:days_remaining) { 0 }
        Then { expect(item.quality).to eq(quality) }
      end

      context 'after sell date' do
        Given(:days_remaining) { -10 }
        Then { expect(item.quality).to eq(quality) }
      end
    end

    context 'Backstage pass' do
      Given(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      Invariant { expect(item.days_remaining).to eq(days_remaining - 1) }

      context 'long before sell date' do
        Given(:days_remaining) { 11 }
        Then { expect(item.quality).to eq(quality + 1) }

        context 'at max quality' do
          Given(:quality) { 50 }
        end
      end

      context 'medium close to sell date (upper bound)' do
        Given(:days_remaining) { 10 }
        Then { expect(item.quality).to eq(quality + 2) }

        context 'at max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'medium close to sell date (lower bound)' do
        Given(:days_remaining) { 6 }
        Then { expect(item.quality).to eq(quality + 2) }

        context 'at max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'very close to sell date (upper bound)' do
        Given(:days_remaining) { 5 }
        Then { expect(item.quality).to eq(quality + 3) }

        context 'at max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'very close to sell date (lower bound)' do
        Given(:days_remaining) { 1 }
        Then { expect(item.quality).to eq(quality + 3) }

        context 'at max quality' do
          Given(:quality) { 50 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'on sell date' do
        Given(:days_remaining) { 0 }
        Then { expect(item.quality).to eq(0) }
      end

      context 'after sell date' do
        Given(:days_remaining) { -10 }
        Then { expect(item.quality).to eq(0) }
      end
    end

    context 'conjured item' do
      before { skip } # TODO: remove this
      Given(:name) { 'Conjured Mana Cake' }

      Invariant { expect(item.days_remaining).to eq(days_remaining - 1) }

      context 'before the sell date' do
        Given(:days_remaining) { 5 }
        Then { expect(item.quality).to eq(quality - 2) }

        context 'at zero quality' do
          Given(:quality) { 0 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'on sell date' do
        Given(:days_remaining) { 0 }
        Then { expect(item.quality).to eq(quality - 4) }

        context 'at zero quality' do
          Given(:quality) { 0 }
          Then { expect(item.quality).to eq(quality) }
        end
      end

      context 'after sell date' do
        Given(:days_remaining) { -10 }
        Then { expect(item.quality).to eq(quality - 4) }

        context 'at zero quality' do
          Given(:quality) { 0 }
          Then { expect(item.quality).to eq(quality) }
        end
      end
    end
  end
end
