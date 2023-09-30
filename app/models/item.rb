class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postfee
  belongs_to :area
  belongs_to :shipdate

  has_one_attached :image

  with_options presence: true do
    validates :image  

    validates :item_name   
  
    validates :explain     
  end
  with_options presence: true , numericality: { other_than: 0, message: "must be other than 0" } do
    validates :category_id 
    validates :state_id     
    validates :postfee_id  
    validates :area_id     
    validates :shipdate_id 
  end
    validates :price , presence: true , numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}


  belongs_to :user
  has_one :order

end