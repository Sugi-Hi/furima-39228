class Order < ApplicationRecord

  def price=(price) #セッター
    @order.price = @item.price
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  attr_accessor :token , :price

  validates :token, presence: true
  validates :price, presence: true


  validates :post_number , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id     , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :city            , presence: true
  validates :tawn            , presence: true
  validates :build           , presence: true
  validates :tel_number  , presence:  {with: /\A[0-9]{11}\z/, message: "is invalid"} 
  
  belongs_to :user
  belongs_to :item
  has_one :delivery

end
