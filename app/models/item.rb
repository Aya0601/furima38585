class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :direction, presence: true
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :long_id
  end
  
  validates :price,presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :user,presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ategory_id
  belongs_to :condition_id
  belongs_to :postage_id
  belongs_to :area_id
  belongs_to :long_id

  has_one_attached :image
end
