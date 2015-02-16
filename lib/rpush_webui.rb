require "rpush_webui/version"
require 'sinatra'
require 'rpush'

module RpushWebui
  def initialize
    get '/' do
      Rpush::Notifications.inspect
    end
  end
end
