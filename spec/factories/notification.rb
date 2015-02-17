#:id => 4335,
#                :badge => nil,
#         :device_token => nil,
#                :sound => "default",
#                :alert => nil,
#                 :data => {
#        "title" => "513 Hi, Test! 1"
#    },
#               :expiry => 86400,
#            :delivered => true,
#         :delivered_at => Fri, 06 Feb 2015 17:46:55 MSK +03:00,
#               :failed => false,
#            :failed_at => nil,
#           :error_code => nil,
#    :error_description => nil,
#        :deliver_after => nil,
#           :created_at => Fri, 06 Feb 2015 17:46:53 MSK +03:00,
#           :updated_at => Fri, 06 Feb 2015 17:46:53 MSK +03:00,
#        :alert_is_json => false,
#                 :type => "Rpush::Client::ActiveRecord::Gcm::Notification",
#         :collapse_key => nil,
#     :delay_while_idle => false,
#     :registration_ids => [
#        [0] "APA91bFzGijid6cWIHHDxm0EbGWN0JyPh0srCL08v-0lDYbvjIiT3YHzyL-n2PeZpTAYMgfa4GZAeypV2jRetEiUQPpYTPsNgRJMiUqBGmnIcP2WVL2cvudb0CxMfFcCcJBx6_RNOG4XaZEu7zm89WXt3BoRxPyVjw",
#        [1] "APA91bELbYIiVc6hk2F750HJLOodivg58MfynT0DVxXWLRXuMElZ1qao3380EtSZhBRhAFagw3ECN_NmFpnau3hayCOP8E9urmM_3jB3wzA2Y3xkUrtLMzKduYFgQ89bzPrzqveH6g1GMQCc4QP1L0yfqNbtC8pvNg",
#        [2] "APA91bHJcJ6NpYxmRR9mjbGxJBv0RecsSgI2deVt3BZDcCXnJKB36Tx3fiNhKrgHPuCXyIpXDAUVMiVhZtaIm76gYpWHhMaKeqaByAhMN7rkRw4BeQODrYiV5GycXokDH9UjmxsfscKKmIM4Trr77req3XWt4Eb_eg"
#    ],
#               :app_id => 3,
#              :retries => 0,
#                  :uri => nil,
#           :fail_after => nil,
#           :processing => false,
#             :priority => nil,
#             :url_args => nil,
#             :category => nil
FactoryGirl.define do
  factory :rpush_gcm_notification, class: 'Rpush::Gcm::Notification' do
    registration_ids { generate :registration_ids }
    association :app, factory: :rpush_gcm_app
    data { generate :gcm_data }
  end
end
