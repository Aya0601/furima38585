class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @category_parent =  Category.where("ancestry is null")
  end

  def show
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
    params.require(:item).permit(:item_name,:direction,:category_id,:condition_id,:postage_id,:area_id,:long_id,:price,: [:url, :id]).merge(seller_id: current_user.id)
  end

end
