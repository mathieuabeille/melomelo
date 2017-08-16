class BasketsController < ApplicationController

  # GET /baskets
  def index
    @basket = current_user.baskets
  end

  # DELETE /baskets/:id
  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy
    redirect_to baskets_path
  end

  # POST /clothes/:clothe_id/baskets
  def create
    @basket = Basket.new
    @cloth = Cloth.find(params[:id])
    @basket.cloth = @cloth
    @basket.user = current_user
    @basket.save
  end
end
