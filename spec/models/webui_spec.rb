require 'spec_helper'

describe WebUI do
  let(:notifications) { create :rpush_gcm_notification } 

  it "should do something" do
    puts notifications.inspect
    false.should eq true
  end
end
