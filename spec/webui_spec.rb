require 'webui'
require 'spec_helper'

describe 'WebUI App' do

  def app
    Sinatra::Application
  end
  
  it 'GET index' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'GET data' do
    get '/data/2015-02-18,14:00:00/2015-02-18,14:00:10/1'
    expect(last_response).to be_ok
  end

end
