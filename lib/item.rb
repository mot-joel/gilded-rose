class Item
  DEFAULT_CONFIG = {
    retained_quality: false,
    gains_quality: false,
    accelerating_quality: false,
    continuous_quality: false,
    hard_expiration: false,
    eternal: false
  }

  attr_accessor :config

  def initialize(config)
    set_config(config)
  end

  def set_config(config)
    @config = DEFAULT_CONFIG.merge(config)
  end
end