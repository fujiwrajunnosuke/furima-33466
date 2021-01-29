class ItemsController < ApplicationController
  def index
  end

  def new 
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:category_id,:state_id,:delivery_price_id,:delivery_prefecture_id,:delivery_day_id,:price).merge(user_id: current_user.id)  
  end
end
