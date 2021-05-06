require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '内容に問題ない場合' do
      it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "パスワードは、6文字以上で且つ英数字混合入力が必須であること" do
        @user.password
        expect(@user).to be_valid
      end
      it "全て入力されている状態で保存出来る" do
        @user
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
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
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailには「@」を含まないと登録できない" do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、5文字以下では登録できない" do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが半角数字のみでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it "パスワードは全角では登録できないこと" do
        @user.password = 'あabc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは半角英数混合(半角英語のみ)" do
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
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end