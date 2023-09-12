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
  validates :nickname,  presence: { less_than_or_equal_to: 40 , message: ":40文字以下で何か入力して下さい" } 
  
  validates :email,           format:   {with: /\A[a-z0-9@]+\z/,  message: ":@を含んで入力して下さい"}
  validates :password,        format:   {with: /\A[a-z0-9]+\z/i,   message: ":英字と数字の両方を含む6字以上で入力して下さい"}
  validates :password_confirmation, presence: {equal_to: :password , message: ":パスワードで確認と不一致です"}

  validates :last_name,       presence: true         
  validates :first_name,      presence: true 
  validates :last_name_kana , format: {with: /\A[ァ-ヶー]+\z/,   message:":カナで入力して下さい"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/,   message:":カナで入力して下さい"}

  validates :birth_date, presence: {only_integer: true, message:":数字を選択して下さい"}
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
