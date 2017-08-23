class WishesController < ApplicationController
  def index
    @wishes = current_user.wishes
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wishes_params)
    @wish.user = current_user
    if @wish.save
      redirect_to wishes_path
    else
      render "new"
    end
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wishes_params)
      redirect_to wishes_path
    else
      render "edit"
    end
  end

   def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy
    redirect_to wishes_path
  end

  private

  def wishes_params
    params.require(:wish).permit(:tags, :color, :gender, :price, :description, :brand, :material, :name)
  end
end


