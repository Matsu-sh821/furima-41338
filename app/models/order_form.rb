class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block_number, :apartment_name, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Please enter numbers only' }
    validates :token
  end
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number,
                   apartment_name: apartment_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
