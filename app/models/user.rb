class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :orders
  has_many :items

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: ' is invalid. Include both letters and numbers' }
  validates :family_name,      presence: true,
                               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' is invalid. Input full-width characters' }
  validates :first_name,       presence: true,
                               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' is invalid. Input full-width characters' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A([ァ-ヶ一])+\z/, message: ' is invalid. Input full-width katakana characters' }
  validates :first_name_kana,  presence: true,
                               format: { with: /\A([ァ-ヶ一])+\z/, message: ' is invalid. Input full-width katakana characters' }
  validates :birth_day,        presence: true
end