class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname          , presence: { other_than: false , message: "40文字以下で入力して下さい" } 
  # データベース上migrationファイルで登録済み
  # validates :email             , presence: { ohter_than: false ,message: "@を含めてて下さい" }
  # validates :password          , presence: { ohter_than: false ,message: "英字と数字の両方を含めて下さい" }
 
  # with_options presence: true do
  validates :nickname,              presence: true
  # presence: { less_than_or_equal_to: 40 , message: ",please input in less than 40" }    
  # validates :email, format: {with: /\A[a-z0-9@]+\z/i , message: ":input with @"}
  validates :password,              presence: {greater_than_or_equal_to: 6,  message: "is too short ,minimum is 6 characters"}
  # validates :password_confirmation, presence: {equal_to: :password, message: "doesn't match Password"}
  validates :last_name,             presence: true 
  validates :first_name,            presence: true 
  validates :last_name_kana , format: {with: /\A[ァ-ヶー]+\z/,   message:",please input full-width katakana"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/,   message:",please input full-width katakana"}

  validates :birth_date,            presence: true
  # numericality: {only_integer: true, greater_than_or_equal_to: 1930, less_than_or_equal_to: 2018, message:",please select all"}
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
