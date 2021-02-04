class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.find_by(user_id: current_user.id)
  end
  
  
  def show
    @purchase = Purchase.find_by_id(params[:id])
  end

  def new
    @user = current_user
    @purchase = Purchase.new
  end

  def edit
    @user = current_user
    @purchase = Purchase.find_by_id(params[:id])
  end

  def destroy
    @purchase = Purchase.find_by_id(params[:id])
    @purchase.destroy
    redirect_to user_purchases_path
  end


end