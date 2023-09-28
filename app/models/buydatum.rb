class Buydatum < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token , :price , :user_id, :item_id, :order_id , :post_number , :area_id , :city, :tawn , :build, :tel_number 


  validates :token, presence: true
  validates :price, presence: true

  validates :post_number , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id     , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :city            , presence: true
  validates :tawn            , presence: true
  validates :build           , presence: true
  validates :tel_number  , presence:  {with: /\A[0-9]{10}[0-9]{11}\z/, message: "is invalid. Remove hyphen(-)"} 


end
