# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'redis-models'
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Viennot", "Mathias Lecuyer"]
  s.email       = ["nicolas@viennot.biz", "mathias@lecuyer.me"]
  s.homepage    = "https://github.com/nviennot/redis-models"
  s.summary     = "Redis Models"
  s.description = "Redis Models"
  s.license     = "LGPLv3"

  s.add_dependency "redis", "~> 3.0.7"
  s.add_dependency "hashie", "~> 2.1.0"

  s.files        = Dir["lib/**/*"] + ['README.md']
  s.require_path = 'lib'
  s.has_rdoc     = false

  s.required_ruby_version = '>= 1.9.3'
end
