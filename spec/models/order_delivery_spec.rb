require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)

    @order = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
  end

  describe '出品中商品の購入に関する可否テストコード' do


    context '正常系テストコード' do
      # -----正常(異常なしの時)テスト-----
      it "価格・クレジットカード情報(カード番号・期限・CVC全て)、配送先(住所・連絡先)と全て必要項目に入力すれば購入できます" do
        @order.valid?
        expect(@order).to be_valid
      end
      it "任意の建物は空でも、必須全て適切な入力すれば購入できます" do
        @order.build = ""
        @order.valid?
        expect(@order).to be_valid
      end
    end


    context '異常系テストコード' do
      # -----正常(異常なしの時)テスト-----
      example "郵便番号に半角ハイフン(-)含まないと購入できません" do
        @order.post_number = "6200886"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      example "郵便番号に全角ハイフンだと購入できません" do
        @order.post_number = "620－0886"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      example "電話番号が9桁以下だと購入できません" do
        @order.tel_number = "075139751"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid. Input from 10 to 11 digits")
      end
      example "電話番号が12桁以上だと購入できません" do
        @order.tel_number = "075139751279"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid. Input from 10 to 11 digits")
      end
      example "電話番号が半角数字以外が含まれると購入できません" do
        @order.tel_number = "+90-1397127"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid. Input from 10 to 11 digits")
      end
      example "都道府県が---でも購入できません" do
        @order.area_id = "---"  
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 0")
      end
      # -----------空テスト-----------
      it "価格に登録が無いと購入できません" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
      it "tokenが空(クレジットカード情報欠け)では購入できません" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できません" do
        @order.post_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it "都道府県が0(空)では購入できません" do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 0")
      end
      it "市区町村が空では購入できません" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できません" do
        @order.tawn = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Tawn can't be blank")
      end
      it "電話番号が空では購入できません" do
        @order.tel_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number can't be blank")
      end
      it "user(購入者)が紐付いてないと購入できません" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it "item(出品商品)が紐付いてないと購入できません" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end

  end


end


