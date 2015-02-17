FactoryGirl.define do
  sequence :registration_ids do |n|
    ["APA91bFzGijid6cWIHHDxm0EbGWN0JyPh0srCL08v-0lDYbvjIiT3YHzyL-n2PeZpTAYMgfa4GZAeypV2jRetEiUQPpYTPsNgRJMiUqBGmnIcP2WVL2cvudb0CxMfFcCcJBx6_RNOG4XaZEu7zm89WXt3BoRxPyVjw"]
  end

  sequence :gcm_data do |n|
    { title: "title_#{n}", text: "text_#{n}" }
  end
end
