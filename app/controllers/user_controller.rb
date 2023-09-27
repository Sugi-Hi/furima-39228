class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def order
    @user = User.find(params[:id])
    @order = @user.order.new
  end
end
