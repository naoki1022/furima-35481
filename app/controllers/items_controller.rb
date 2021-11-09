class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :condition_id, :shipping_cost_id,
                                 :shipping_day_id, :shipping_place_id)
  end
end
