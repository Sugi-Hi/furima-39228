class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postfee
  belongs_to :area
  belongs_to :shipdate


  validates :item_name   , presence: true
  validates :price       , numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  validates :explain     , presence: true
  validates :category_id , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :state_id    , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :postfee_id  , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :area_id     , numericality: { other_than: 0, message: "must be other than 0" } 
  validates :shipdate_id , numericality: { other_than: 0, message: "must be other than 0" } 

  
  has_one_attached :image
  validates :image       , presence: true

  belongs_to :user
  has_one :order



end
