require 'rails_helper'

RSpec.describe User, type: :model do
  # userの生成インスタンス変数@userをテスト用のみに実験登録
  before do
    @tuser = FactoryBot.build(:t_user)
    @user = FactoryBot.build(:f_user)

  end

  describe 'ユーザー新規登録の可否テストコード' do

    context 'ユーザー新規登録できる場合' do
      # -----正常(異常なしの時)テスト-----
      it 'ニックネーム・メールアドレス・パスワード,(確認も)・お名前(氏,名)・お名前カナ(氏,名)・生年月日が全て存在・規定内でれば登録できます'  do
        @tuser.valid?
        expect(@tuser).to be_valid
      end
    end

    context 'ユーザー新規登録できない場合' do
      # -----規定外テスト-----

      example 'メールアドレスに@含まないと登録できません' do
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      example 'パスワードが英数6字以上でないと登録できません'  do
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      example 'パスワード確認が一致してないと登録できません'  do
        @user.password = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      example 'お名前(氏)がカナでないと登録できません'  do
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana ,please input full-width katakana")
      end
      example 'お名前(名)がカナでないと登録できません'  do
        @user.valid?
         expect(@user.errors.full_messages).to include("First name kana ,please input full-width katakana")
      end
      example '生年月日が年月日1つでも無いと登録できません'  do
        @user.birth_date = "1900-12-"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      
      # -----空テスト-----
      it 'ニックネームが空だと登録できません'  do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できません'  do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空だと登録できません'  do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワード確認も空だと登録できません'  do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(氏)が空だと登録できません'  do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(名)が空だと登録できません'  do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(氏)が空だと登録できません'  do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana ,please input full-width katakana")
      end
      it 'お名前(名)が空またはカナでないと登録できません'  do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana ,please input full-width katakana")
      end
      it '生年月日が空だと登録できません'  do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end


  end



  # pending "add some examples to (or delete) #{__FILE__}"
end
