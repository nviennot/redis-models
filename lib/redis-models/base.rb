class RedisModels::Base < Hashie::Dash
  property :id, :required => true

  def self.create(attrs)
    self.new(attrs).tap { |m| m.save }
  end

  def self.namespace
    self.name
  end

  def self.find(id)
    attrs = RedisModels.redis.hgetall("#{self.namespace}:#{id}")
    new(attrs) if attrs && attrs.size > 0
  end

  def self.ids
    RedisModels.redis.keys("#{self.namespace}:*")
                     .map { |id| id.gsub(/^#{self.namespace}:/, '') }
  end

  def _redis_key
    "#{self.class.namespace}:#{id}"
  end

  def delete
    RedisModels.redis.del(_redis_key)
  end

  def save
    RedisModels.redis.hmset(_redis_key, *self.to_a.flatten)
  end
end
