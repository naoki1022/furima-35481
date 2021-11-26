class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_place_id, :city, :address, :building_name, :phone, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/ , message: "is invalid"}
    validates :token
  end
  validates :phone, numericality: { only_integer: true, message: "is invalid. Input only number"}
  validates :shipping_place_id, numericality: { other_than: 1, message: "can't be blank" }

  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_place_id: shipping_place_id, city: city, address: address,
                   building_name: building_name, phone: phone, order_id: order.id)
  end
end