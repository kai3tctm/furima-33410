class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :estimated_delivery
  has_many :comments
  has_one :buys
  has_one :address
  has_one_attached :image

  with_options presence: true do
    validates :product_name, :price, :product_info, :category_id, :product_status_id, :delivery_burden_id, :delivery_area_id, :estimated_delivery_id, :image
  end
  validates :category_id, :product_status_id, :delivery_burden_id, :delivery_area_id, :estimated_delivery_id, numericality: { other_than: 1, message: "-- 以外の項目を選択して下さい"}
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "半角数字で金額を入力して下さい（¥300〜9,999,999まで）"}

end
