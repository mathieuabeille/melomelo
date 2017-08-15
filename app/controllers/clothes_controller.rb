class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy]

  def index
    @clothes = Cloth.all
  end
end
