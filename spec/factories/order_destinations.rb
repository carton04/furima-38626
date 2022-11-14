FactoryBot.define do
  factory :order_destination do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '1' }
    address { '1' }
    building_name { '寮'}
    phone_number { '00000000000' }
    token { 'tok_abcde0000000' }
    user_id { 1 }
    item_id { 1 }
  end
end