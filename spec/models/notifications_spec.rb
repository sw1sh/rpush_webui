require 'models/notifications'
require 'spec_helper'

describe Notifications do
  
  let!(:start_at) { 3.seconds.ago }
  let!(:finish_at) { start_at + 3.seconds }

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
    notifications.each do |seconds, is_delivered|
      if is_delivered
        create :rpush_gcm_notification, delivered_at: start_at + seconds, 
                                        delivered: is_delivered
      else
        create :rpush_gcm_notification, failed_at: start_at + seconds, 
                                        delivered: is_delivered
      end
    end
  end

  subject { Notifications.new dt: 1.second, start_at: start_at, finish_at: finish_at }

  let(:expected_data) {
    { 0 => {true => 1, false => 1}, 1 => {true => 3, false => 1},
      2 => {true => 3, false => 1}, 3 => {true => 0, false => 1} }
  }

  its(:data) { is_expected.to eq(expected_data) }


end
