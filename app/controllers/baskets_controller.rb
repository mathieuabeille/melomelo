class BasketsController < ApplicationController

  # GET /baskets
  def index
    @basket = current_user.baskets
  end

  # DELETE /baskets/:id
  def destroy
  end

  # POST /clothes/:clothe_id/baskets
  def create
  end
end
