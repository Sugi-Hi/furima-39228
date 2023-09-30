class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_order
  before_action :same_top, only: :index 


  def index    
    @order_delivery = OrderDelivery.new

  end

  def create
    # binding.pry # テストコード用
    # @order = Order.new(order_params) #Formオブジェクト前の代入!!
    @order_delivery = OrderDelivery.new(order_params)
    @order_delivery.price = @item.price

    if @order_delivery.valid?
      pay_item
      @order_delivery.save
   
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_delivery).permit(:token ,:price ,:post_number, :area_id, :city, :tawn, :build, :tel_number ).merge(user_id: current_user.id , item_id: params[:item_id] , token: params[:token])
  end

  def set_item_order
    @item = Item.find(params[:item_id])

    # @order = Order.new  #Formオブジェクト前の代入!!
    # @delivery = Delivery.new  #Formオブジェクト前の代入!!
  end

  def same_top
    if  @item.order != nil || current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
