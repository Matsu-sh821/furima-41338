class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname, presence: true
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/ }
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/ }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day, presence: true
  end
end
