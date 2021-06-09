class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :municipality, :house_number, :building, :phone

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号は半角3桁とハイフンと半角4桁で入力して下さい" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "市区町村は全角文字で入力して下さい" }
    validates :house_number
    validates :phone, format: { with: /\A\d{11}\z/, message: "電話番号は半角数字11桁以内ハイフンなしで入力して下さい" }
  end

  def save
    Buy.create(user_id:user_id, item_id:item_id)
    Address.create(postal_code:postal_code, delivery_area_id:delivery_area_id, municipality:municipality, house_number:house_number, building:building, phone:phone)
  end
end