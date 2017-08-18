class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy]

  # GET /clothes?name=fdslfdsmlfdsnm
  def index
    # @clothes = ClothesFilter.new(params).filter
    @clothes = Cloth.all.page(params[:page] || 1)
    @baskets = current_user.baskets
  end

  # def create
  # faut-il créer une methode???
  # end

end
