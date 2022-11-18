FactoryBot.define do
  factory :item do
    item_name                    { 'test_itemname' }
    item_info                    { 'test_iteminfo' }
    item_category_id             { '3' }
    item_sales_status_id         { '2' }
    item_shipping_fee_status_id  { '2' }
    item_prefecture_id           { '16' }
    item_scheduled_delivery_id   { '2' }
    item_price                   { '7000' }
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
