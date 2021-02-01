require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:user)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it "カラムを全て満たせば、登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "introductionが空だと登録できない" do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it "category_idが1だと登録できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "state_idが1だと登録できない" do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it "delivery_price_idが1だと登録できない" do
        @item.delivery_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price must be other than 1")
      end

      it "delivery_prefecture_idが1だと登録できない" do
        @item.delivery_prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture must be other than 1")
      end

      it "delivery_day_idが1だと登録できない" do
        @item.delivery_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "userが紐付いていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
