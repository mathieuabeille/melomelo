class WishesController < ApplicationController
  def index
    @wishes = current_user.wishes
  end

  def create
    @wish = Wish.new
  end

   def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy
    redirect_to wishes_path
  end
end
