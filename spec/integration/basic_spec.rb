require 'spec_helper'

describe 'Redis Models' do
  before do
    define_constant :User, RedisModels::Base do
      property :name
      property :email
    end
  end

  it 'CRUD' do
    u = User.create(id: 'john', name: 'John')
    User.find(u.id).name.should == 'John'

    u.name = 'Marcel'
    u.save
    User.find(u.id).name.should == 'Marcel'

    u.delete
    User.find(u.id).should == nil
  end

  it 'finds keys' do
    ids = %w(robert marcelus arthur)
    ids.each { |id| User.create(id: id) }
    User.ids.should =~ ids
  end
end
