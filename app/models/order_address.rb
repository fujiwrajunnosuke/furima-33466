class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid."}
    validates :user_id
    validates :item_id
  end

  validates :delivery_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_prefecture_id: delivery_prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end