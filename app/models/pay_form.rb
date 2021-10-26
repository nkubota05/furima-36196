class PayForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: ' Input correctly' },
                        presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'serect' }
  validates :city,          presence: true
  validates :address,       presence: true
  validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: ' Input only number' },
                            presence: true
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city,
                                     address: address, building_name: building_name, phone_number: phone_number)
  end
end
