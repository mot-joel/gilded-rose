$LOAD_PATH.unshift File.join __dir__, '..', 'lib'
require 'minitest/autorun'
require 'purdytest'

Minitest::Test.parallelize_me!
