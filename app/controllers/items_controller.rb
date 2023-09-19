class ItemsController < ApplicationController
  before_action :set_item , except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  # before_aciton :item_params , only: [:new, :create, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  # def edit
  # end

  # def destroy
  # end

  def order
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :explain, :category_id, :state_id, :postfee_id, :area_id, :shipdate_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end