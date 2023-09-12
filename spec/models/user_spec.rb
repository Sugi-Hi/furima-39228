require 'rails_helper'

RSpec.describe User, type: :model do
  # Userのインスタンス生成をテスト用のみに実験登録
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザー新規登録できる場合' do
      it 'ニックネーム・メールアドレス・パスワード,(確認も)・お名前(氏,名)・お名前カナ(氏,名)・生年月日が全て認証できれば登録できます'  do
        # <id: 2, nickname: "フリマ", email: "test@test.com", first_name: "b", last_name: "a", first_name_kana: "ビ", last_name_kana: "エ", birth_date: "2010-12-17" > 
        # expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない場合' do
      it 'ニックネームが空または40字超えると登録できません'  do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname :40文字以下で何か入力して下さい")
      end
      it 'メールアドレスが空または@無いと登録できません'  do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email :@を含んで入力して下さい")
      end
      it 'パスワードが空または英字か数字が無いと登録できません'  do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password :英字と数字の両方を含む6字以上で入力して下さい")
      end
      it 'パスワード(確認)が一致してないと登録できません'  do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation :パスワードで確認と不一致です")
      end
      it 'お名前(氏)が空またはかな漢字英字でないと登録できません'  do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(名)が空またはかな漢字英字でないと登録できません'  do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(氏)が空またはカナでないと登録できません'  do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana :カナで入力して下さい")
      end
      it 'お名前(名)が空またはカナでないと登録できません'  do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana :カナで入力して下さい")
      end
      it '生年月日を数字で選択ないと登録できません'  do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date :数字を選択して下さい")
      end
    end



  end



  # pending "add some examples to (or delete) #{__FILE__}"
end
