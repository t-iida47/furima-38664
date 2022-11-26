FactoryBot.define do
  factory :order_address do
    user_id { 3 }
    item_id { 3 }
    postal_code { '123-4567' }
    item_prefecture_id { 7 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end


