class WishlistsController < ApplicationController
  skip_before_action :authenticate_user, only [:index, :edit, ]
  def index
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
