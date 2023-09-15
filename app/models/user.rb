class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  validates :nickname,              presence: true

  validates :password,        format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name,       format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ",please input full-width characters"}
  validates :first_name,      format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ",please input full-width characters"}
  validates :last_name_kana , format: {with: /\A[ァ-ヶー]+\z/,   message:",please input full-width katakana"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/,   message:",please input full-width katakana"}

  validates :birth_date,            presence: true


  
end
