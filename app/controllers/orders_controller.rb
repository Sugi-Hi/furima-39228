class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :return_signin, only: :index
before_action :set_item 
before_action :same_top, only: :index 


  def index
    @delivery = Delivery.new
  end

  def create
    # binding.pry # テストコード用
    @order = Order.new(order_params)
    @order.price = @item.price

    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order).permit(:token ,:price ,:post_number, :area_id, :city, :tawn, :build, :tel_number ).merge(user_id: current_user.id , item_id: params[:item_id] , token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def return_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
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
