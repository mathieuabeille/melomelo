class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy]

  # GET /clothes?name=fdslfdsmlfdsnm
  def index
    @clothes = ClothesFilter.new(params).filter
    @clothes = @clothes.page(params[:page] || 1)
    @baskets = current_user.baskets
  end

end
