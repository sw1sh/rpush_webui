require "rpush_webui/version"
require 'sinatra'
require 'rpush'

module RpushWebui
  class Rpush::WebUI
    def initialize
      get '/' do
        Rpush::Notifications.inspect
      end
    end
  end
end
