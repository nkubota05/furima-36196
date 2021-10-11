class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,  numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :price, format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: true
  belongs_to :user
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :category
  has_one_attached :image
end
