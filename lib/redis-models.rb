require 'redis'
require 'hashie'

module RedisModels
  class << self; attr_accessor :redis; end
end

require 'redis-models/base'
