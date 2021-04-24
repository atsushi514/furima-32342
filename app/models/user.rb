class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many   :products
  has_many   :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
  validates :nickname
  validates :birth_day
  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Input full-width characters." } do
  validates :family_name
  validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters." } do
  validates :family_name_kana
  validates :first_name_kana
  end
end
  validates :email, uniqueness: true 
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Input Password Include both letters and numbers." }
end