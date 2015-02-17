ENV['RACK_ENV'] = 'test'

require 'webui'
require 'spec_helper'
require 'rack/test'

describe 'WebUI App' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:notifications) { create :rpush_gcm_notification } 

  it "GET index" do
    get '/'
    expect(last_response).to be_ok
  end
end
