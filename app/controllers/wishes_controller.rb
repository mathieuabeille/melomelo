class WishesController < ApplicationController
  def index
    @wishes = current_user.wishes
  end

  def new
    @wish = Wish.new(
      name: params[:name],
      brand: params[:brand],
      color: params[:color],
      price: price,
      material: params[:material],
      gender: gender
    )
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

  def price
    return if params[:price].include?('high')
    return 150 if params[:price].include?('middle')
    return 50 if params[:price].include?('low')
  end

  def gender
    return 'men' if params[:gender].include?('men')
    return 'women' if params[:gender].include?('women')
  end
end
