require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "password:半角英数混合(半角英語のみ)" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
    end
    it "苗字が全角文字になってるか否か" do
      @user.last_name = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "名前が全角文字になってるか否か" do
      @user.first_name = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "ミョウジが全角カタカナになってるか否か" do
      @user.last_name_katakana = '苗字'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana カタカナを使用してください")
    end
    it "ナマエが全角カタカナになってるか否か" do
      @user.first_name_katakana = '名前'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana カタカナを使用してください")
    end
  end
end