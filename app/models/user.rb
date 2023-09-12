class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         #, :validatable

  # validates :nickname          , presence: { other_than: false , message: "40文字以下で入力して下さい" } 
  # データベース上migrationファイルで登録済み
  # validates :email             , presence: { ohter_than: false ,message: "@を含めてて下さい" }
  # validates :password          , presence: { ohter_than: false ,message: "英字と数字の両方を含めて下さい" }
 
  # with_options presence: true do
  validates :nickname,  presence: { less_than_or_equal_to: 40 , message: ":40文字以下で入力して下さい" } 
  validates :email,     format:   {with: /\A[a-z0-9@]+\z/i,  message: ":@を含め、英数字で入力して下さい"}
  validates :password,  format:   {with: /\A[a-z0-9]+\z/i,   message: ":英字と数字の両方を含め、6字以上で入力して下さい"}
  validates :last_name,       format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,   message:":かなカナ漢字で入力して下さい" }         
  validates :first_name,      format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,   message:":かなカナ漢字で入力して下さい"}  
  validates :last_name_kana , format: {with: /\A[ァ-ヶー]+\z/,   message:":カナで入力して下さい"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/,   message:":カナで入力して下さい"}
  validates :birth_date,      format: {with: /\A[0-9]+\z/i,   message:":数字を選択して下さい"}
  # end


  
  # , presence: true
  # def at_mark
  #   if email.includes("@")
  #     return true
  #   else
  #     return false
  #   end
  # end

end
