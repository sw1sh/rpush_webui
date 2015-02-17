require 'rpush'
load 'config/rpush.rb'

require 'rspec/core'
require 'fakeredis'
require 'rspec/its'
require 'rack/test'
require 'factory_girl'

require 'factories/notification'
require 'factories/sequences'
require 'factories/app'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods

  config.after { Redis.new.flushdb }

  config.raise_errors_for_deprecations!

  config.mock_with :rspec

  config.color = true
  config.order = :random
end
