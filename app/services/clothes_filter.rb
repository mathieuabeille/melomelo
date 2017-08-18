class ClothesFilter

  def initialize(params)
    @params = params
    @clothes = Cloth.all
  end

  def filter(params)

    filter_by_price
    filter_by_gender
    filter_by_color
    filter_by_ascending

    @clothes
  end



  def filter_by_price
    if params[:price].present?
      @clothes = @clothes.where("price <= ?", 50) if params[:price] == "low"
      @clothes = @clothes.where("price >= ? and price < ?", 50, 150) if params[:price] == "middle"
      @clothes = @clothes.where("price >= ?", 150) if params[:price] == "high"
    end
  end

  def filter_by_gender
    if params[:gender].present?
      @clothes = @clothes.where("gender ?", male) if params[:price] == "male"
      @clothes = @clothes.where("gender?", female) if params[:price] == "female"
    end
  end

  def filter_by_color
    if params[:color].present?
      @clothes = @clothes.where("color ?", black) if params[:price] == "black"
      @clothes = @clothes.where("color?", blue) if params[:price] == "blue"
      @clothes = @clothes.where("color?", orange) if params[:price] == "orange"
      @clothes = @clothes.where("color?", purple) if params[:price] == "purple"
      @clothes = @clothes.where("color?", red) if params[:price] == "red"
      @clothes = @clothes.where("color?", yellow) if params[:price] == "yellow"
      @clothes = @clothes.where("color?", white) if params[:price] == "white"
    end
  end

  def filter_by_ascending
    if params[:price_asc_desc].present?
      @clothes = @clothes.order(price: :asc) if params[:price] == "ascending"
    else
      @clothes = @clothes.order(price: :desc) if params[:price] == "descending"
  end


    # if params[:size].present?
    #   @clothes = @clothes.where("size <= ?", 36) if small
    #   @clothes = @clothes.where("size >= ? and size <= ?", 38) if medium
    #   @clothes = @clothes.where("size >= ?", 40) if large

    # end
end
