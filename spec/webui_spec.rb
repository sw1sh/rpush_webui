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

end
