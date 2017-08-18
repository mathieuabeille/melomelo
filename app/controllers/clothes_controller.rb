class ClothesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy]

  def index
    #@clothes = ClothesFilter.new(params).filter
    @clothes = Cloth.all

  end
end
