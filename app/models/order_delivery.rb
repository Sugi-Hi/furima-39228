class OrderDelivery

  include ActiveModel::Model
  attr_accessor :token , :price , :user_id, :item_id, :order_id , :post_number , :area_id , :city, :tawn , :build, :tel_number 

  with_options presence: true do

    validates :token
    validates :price

    validates :post_number , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id     , numericality: { other_than: 0, message: "must be other than 0" } 
    validates :city    
    validates :tawn    
    # validates :build   # 任意の為無くても大丈夫!
    validates :tel_number  , format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Input from 10 to 11 digits"} 
  
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数orderへ代入!!
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所情報も保存し、order_idには、変数orderのidに指定!!
    Delivery.create(post_number: post_number, area_id: area_id, city: city, tawn: tawn, build: build, tel_number: tel_number, order_id: order.id)
  end

end
