require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '内容に問題がない場合' do
      it "販売価格が半角数字が必須であること" do
        @items.price = '1000'
        expect(@items).to be_valid
      end
      it "全て入力されている状態で保存出来る" do
        @items
        expect(@items).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "商品名が入力されていないと登録できない" do
        @items.product_name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品の説明が入力されていないと登録できない" do
        @items.product_info = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Product info can't be blank")
      end
      it "カテゴリーが--のままだと登録できない" do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Category -- 以外の項目を選択して下さい")
      end
      it "商品の状態が--のままだと登録できない" do
        @items.product_status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Product status -- 以外の項目を選択して下さい")
      end
      it "配送料の負担が--のままだと登録できない" do
        @items.delivery_burden_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Delivery burden -- 以外の項目を選択して下さい")
      end
      it "発送元の地域が--のままだと登録できない" do
        @items.delivery_area_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Delivery area -- 以外の項目を選択して下さい")
      end
      it "発送までの日数が--のままだと登録できない" do
        @items.estimated_delivery_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Estimated delivery -- 以外の項目を選択して下さい")
      end
      it "販売価格が入力されていないと登録できない" do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input half-width characters.", "Price 半角数字で金額を入力して下さい（¥300〜9,999,999まで）")
      end
      it "販売価格が全角数字で入力されていると登録できない" do
        @items.price = '３０００'
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is invalid. Input half-width characters.", "Price 半角数字で金額を入力して下さい（¥300〜9,999,999まで）")
      end
      it "販売価格が¥300以下の数字で入力されていると登録できない" do
        @items.price = 200
        @items.valid?
        expect(@items.errors.full_messages).to include("Price 半角数字で金額を入力して下さい（¥300〜9,999,999まで）")
      end
      it "販売価格が¥9,999,999以上の数字で入力されていると登録できない" do
        @items.price = 10000000
        @items.valid?
        expect(@items.errors.full_messages).to include("Price 半角数字で金額を入力して下さい（¥300〜9,999,999まで）")
      end
      it "画像が選択されていないと登録できない" do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end
      it "商品に紐づくユーザーがいない場合登録できない" do
        @items.user = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("User must exist")
      end
    end
  end
end
