class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  with_options presence: true do
  validates :nickname
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Input full-width characters." }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Input full-width characters." }
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters." }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters." }
  validates :birth_day
  end
  validates :email, uniqueness: true 
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Input Password Include both letters and numbers." }
end