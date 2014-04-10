require 'rubygems'
require 'bundler'
Bundler.require

SPEC_ROOT = File.expand_path File.dirname(__FILE__)
Dir["#{SPEC_ROOT}/support/**/*.rb"].each { |f| require f unless File.basename(f) =~ /^_/ }

RedisModels.redis = Redis.new

RSpec.configure do |config|
  config.color_enabled = true

  config.before(:each) do
    RedisModels.redis.flushdb
  end
end
