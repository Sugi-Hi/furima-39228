class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :post_number , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id     , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :city            , presence: true
  validates :tawn            , presence: true
  validates :build           , presence: true
  validates :tel_number  , presence: true, format: {with: /\A[0-9]{10}[0-9]{11}\z/, message: "is invalid. Remove hyphen(-)"}  



  belongs_to :order

end
