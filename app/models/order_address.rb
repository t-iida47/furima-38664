class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:postal_code,:item_prefecture_id,:city,:address,:building,:phone_number,:token

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}, presence: true
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }, presence: true
  validates :token, presence: true



  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShipAddress.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end