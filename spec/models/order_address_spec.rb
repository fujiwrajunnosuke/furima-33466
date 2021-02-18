require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @user.save
    @item.save
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id )
    sleep 1
  end

  describe '購入機能実装' do
    context '購入ができる時' do
      it "必須のカラムをすべて満たせば、購入できる" do
          expect(@order_address).to be_valid
      end

      it "building_nameが空でも登録できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '購入ができない時' do
      it "tokenが空だと登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空だと登録できない" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角のハイフンが含まれていないと登録できない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "delivery_prefecture_idが1だと登録できない" do
        @order_address.delivery_prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery prefecture can't be blank")
      end

      it "municipalityが空だと登録できない" do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it "house_numberが空だと登録できない" do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが9桁では登録できない" do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "phone_numberが12桁では登録できない" do
        @order_address.phone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "phone_numberが全角数字だと登録できない" do
        @order_address.phone_number = "１２３４５６７８９０１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "phone_numberは英数混合では登録できない" do
        @order_address.phone_number = "1a2b3c4d5e6f"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "user_idが空だと登録できない" do
        @order_address.user_id = nil
        @order_address.valid?
      end

      it "item_idが空だと登録できない" do
        @order_address.item_id = nil
        @order_address.valid?
      end
    end
  end
end
