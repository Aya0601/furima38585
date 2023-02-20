class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user

  validates :user, presence:true
  validates :image, presence:true
  validates :item_name, presence: true
  validates :direction, presence: true
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :long_id
  end
  
  validates :price,presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :user,presence: true
 
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :long

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image

end
