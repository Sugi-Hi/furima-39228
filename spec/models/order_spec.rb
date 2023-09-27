require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '出品中商品の購入に関する可否テストコード' do


    context '正常系テストコード' do
      # -----正常(異常なしの時)テスト-----
      it "価格・クレジットカード情報(カード番号・期限・CVC全て)、配送先の住所・連絡先と全部揃えば購入できます" do
        @order.valid?
        expect(@order).to be_valid
      end
    end


    context '異常系テストコード' do
      # -----正常(異常なしの時)テスト-----
      example "郵便番号にハイフン入れないと購入できません" do
        @order.post_number = "6200886"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end

      
      # -----------空テスト-----------
      it "価格が登録無いとでは購入できません" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
      it "クレジットカード情報が一つでも欠けると購入できません" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できません" do
        @order.post_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it "都道府県が---(0)では購入できません" do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 0")
      end
      it "市区町村が空では購入できません" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できません" do
        @order.tawn = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tawn can't be blank")
      end
      it "電話番号が空では購入できません" do
        @order.tel_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid")
      end

    end

  end


end
