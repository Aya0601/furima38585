class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    # この時点では、buyer_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:buyer_address).permit(:post_code, :area_id, :city, :address_number, :house_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,        
      card: buyer_params[:token], 
      currency: 'jpy'             
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end
end
