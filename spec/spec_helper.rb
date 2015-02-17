require 'webui'
require 'rpush'
load 'config/rpush.rb'

require 'rspec'
require 'rack/test'
require 'factory_girl'


require_relative 'factories/notification'
require_relative 'factories/sequences'
require_relative 'factories/app'


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods

  config.raise_errors_for_deprecations!

  config.mock_with :rspec

  config.color = true
  config.order = :random
end
