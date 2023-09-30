class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do
    validates :nickname

    validates :password,  format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } 
  end

  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ",please input full-width characters"} do
    validates :last_name
    validates :first_name
  end
  with_options format: {with: /\A[ァ-ヶー]+\z/,   message:",please input full-width katakana"} do
    validates :last_name_kana
    validates :first_name_kana
  end
    validates :birth_date,  presence: true


  has_many :items
  has_many :orders
  
end