class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :direction, presence: true
  validates :category_id, presence: true  
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :area_id,presence: true
  validates :long_id,presence: true
  validates :price,presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :user,presence: true

  belongs_to :user
end
