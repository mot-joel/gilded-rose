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
