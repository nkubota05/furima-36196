class PayForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number
  with_options presence: true do
    validates :user_id 
    validates :item_id 
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: ' Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'serect' }
    validates :city
    validates :address
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: ' Input only number' }
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city,
                                     address: address, building_name: building_name, phone_number: phone_number)
  end
end
