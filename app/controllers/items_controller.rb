class ItemsController < ApplicationController
  before_action :access_index , except: [:index, :show]

  def index
  end



  def access_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end