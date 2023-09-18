require 'rails_helper'

RSpec.describe Item, type: :model do
  # itemの生成インスタンス変数@itemをテスト用のみに実験登録
  before do
    # user = FactoryBot.create(:user, name: "テストユーザー")
    @item = FactoryBot.build(:item)

  end

  describe '商品出品の可否テストコード' do

    context '商品出品できる場合' do
      # -----正常(異常なしの時)テスト-----
      it '商品画像・商品名・商品の説明文・商品の詳細(カテゴリー,商品の状態)・配送について(配送料の負担,発送元の地域,発送までの日数)・価格が全て入力・規定内でれば登録できます'  do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      # example '商品画像(ファイル画像)と登録できません' do
      #   @item.image = "写真"
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include("Image is invalid")
      # end
      # example '商品名が40字越えると登録できません'  do
      #   @item.item_name = "garaageahaeg24974gadadragaearhaegdfgrhaarheagarg166arg449agrgaeagreavre"
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include("")
      # end
      # example '商品の説明が1000字超えると登録できません'  do
      #   @item.explain = Faker::Lorem.sentence(word_count: 10000)
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include("")
      # end

      # -----規定外テスト-----
      example '販売価格が10000000(1000万円)以上だと登録できません'  do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      example '販売価格が299円以下だと登録できません'  do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end


      
      # -----空テスト-----
      it '商品画像(ファイル画像)が空だと登録できません'  do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できません'  do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空だと登録できません'  do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリー(商品の詳細)が---(0)だと登録できません'  do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態(商品の詳細)が---(0)だと登録できません'  do
        @item.state_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it '配送料の負担(配送について)が---(0)だと登録できません'  do
        @item.postfee_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postfee must be other than 0")
      end
      it '発送元の地域(配送について)が---(0)だと登録できません'  do
        @item.area_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it '発送までの日数(配送について)が---(0)だと登録できません'  do
        @item.shipdate_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate must be other than 0")
      end
      it '販売価格が空だと登録できません'  do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '使用者userが紐付いていないとだと登録できません'  do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end


  end



end
