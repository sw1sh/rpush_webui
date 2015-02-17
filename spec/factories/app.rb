require 'rpush'
FactoryGirl.define do
  factory :rpush_gcm_app, class: 'Rpush::Gcm::App' do
    name 'android' 
    auth_key '...'
  end
end
