require 'models/notifications'
require 'spec_helper'

describe Notifications do
  
  let(:now) { Time.new }

  let(:notifications) {
    [[0, true],
     [1, true],
     [1, true],
     [1, true],
     [2, true],
     [2, true],
     [2, true],
     [0, false],
     [1, false],
     [2, false],
     [3, false]]
  }

  before do
    notifications.each do |time, is_delivered|
      if is_delivered
        create :rpush_gcm_notification, delivered_at: now + time, 
                                        delivered: is_delivered
      else
        create :rpush_gcm_notification, failed_at: now + time, 
                                        delivered: is_delivered
      end
    end
  end

  subject { Notifications.new now, 1.second }

  let(:expected_data) {
    { 0 => {true => 1, false => 1}, 1 => {true => 3, false => 1},
      2 => {true => 3, false => 1}, 3 => {true => 0, false => 1} }
  }

  its(:data) { is_expected.to eq(expected_data) }


end
