class ClothesFilter
  # SIZES = {
  #   small:
  # }

  def initialize(params)
    @params = params
    @clothes = Cloth.all
  end

  # def filter(params)
  #   # filter_by_size
  #   # filter_by_category
  #   # filter_by_color
  #   # filter_by_price
  #   # filter_by_gender
  #   # filter_by_name
  #   @clothes
  # end


  def filter_by_size
    if params[:size].present?
      # @clothes = @clothes.where("sizes IN ?", []) if params[:price] == "low"
    end
  end

  def filter_by_price
    if params[:price].present?
      @clothes = @clothes.where("price <= ?", 50) if params[:price] == "low"
      @clothes = @clothes.where("price >= ? and price < ?", 50, 150) if params[:price] == "middle"
      @clothes = @clothes.where("price >= ?", 150) if params[:price] == "high"
    end
  end


    # if params[:size].present?
    #   @clothes = @clothes.where("size <= ?", 36) if small
    #   @clothes = @clothes.where("size >= ? and size <= ?", 38) if medium
    #   @clothes = @clothes.where("size >= ?", 40) if large

    # end
end
