class Conjured < Item
  def tick
    @days_remaining -= 1
    @quality -= 2
    @quality -= 2 if @days_remaining < 1
    @quality = 0 if @quality <= 0
  end
end
