require 'rubygems'
require 'rpush'
load 'config/rpush.rb'
require 'factory_girl'

require_relative 'factories/notification'
require_relative 'factories/sequences'
require_relative 'factories/app'

require_relative '../lib/models/webui'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.raise_errors_for_deprecations!

  config.mock_with :rspec

  config.color = true
  config.order = :random
end
