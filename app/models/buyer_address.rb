class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address_number, :house_name, :telephone, :token

  with_options presence: true do
    # buyersのバリデーション
    validates :user_id
    validates :item_id
    # send_addressのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :address_number
    validates :telephone, format: { with: /\A[0-9]{10,11}\z/}
    # トークンのバリデーション
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user.id, item_id: item.id)
    SendAddress.create(buyer_id: buyer.id, post_code: post_code, area_id: area_id, city: city, address_number: address_number, house_name: house_name, telephone: telephone)
  end
end

