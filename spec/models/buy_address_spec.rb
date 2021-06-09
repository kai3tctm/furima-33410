require 'rails_helper'
RSpec.describe Address, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe "購入画面" do
    context '購入できるとき' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@buy_address).to be_valid
      end

    end

    context '購入できないとき' do
      
    end
  end
end
