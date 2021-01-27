require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it "カラムを全て満たせば、登録できる" do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailの＠がないと登録できない" do
       @user.email = "testetst"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在しても、password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "call_family_nameが空だと登録できない" do
        @user.call_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Call family name can't be blank")
      end

      it "call_first_nameが空だと登録できない" do
        @user.call_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Call first name can't be blank")
      end

      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it "emailが重複しては登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが一致しなくては登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を使用してください")
      end

      it "passwordが半角数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を使用してください")
      end

      it "passwordが全角では登録できないこと" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を使用してください")
      end
      
      it "family_nameは全角文字を使用しなければ、登録できない" do
        @user.family_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end

      it "first_nameは全角文字を使用しなければ、登録できない" do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it "call_family_nameはカナ文字を使用しなければ、登録できない" do
        @user.call_family_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Call family name カナ文字を使用してください")
      end

      it "call_first_nameはカナ文字を使用しなければ、登録できない" do
        @user.call_first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Call first name カナ文字を使用してください")
      end
    end
  end
end
