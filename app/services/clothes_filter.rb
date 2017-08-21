class ClothesFilter
  attr_reader :params

  def initialize(params)
    @params = params
    @clothes = Cloth.all
  end


  def filter
    filter_by_price
    filter_by_gender
    filter_by_color
    filter_by_ascending
    filter_by_name
    @clothes
  end


  def filter_by_name
    if params[:name].present?
      @clothes = @clothes.where("name ilike ?", "%#{params[:name]}%")
    end
  end

  def filter_by_price
    if params[:price].present?

      @clothes = @clothes.where("price <= ?", 50) if params[:price].include? "low"
      @clothes = @clothes.where("price >= ? and price < ?", 50, 150) if params[:price].include? "middle"
      @clothes = @clothes.where("price >= ?", 150) if params[:price].include? "high"
    end
  end

  def filter_by_gender
    if params[:gender].present?
      @clothes = @clothes.where("gender ilike ?", "men") if params[:gender] == "male"
      @clothes = @clothes.where("gender ilike ?", "women") if params[:gender] == "female"
    end
  end

  def filter_by_color
    if params[:color].present?
      @clothes = @clothes.where("color ilike ?", "%black%") if params[:color] == "black"
      @clothes = @clothes.where("color ilike ?", "%blue%") if params[:color] == "blue"
      @clothes = @clothes.where("color ilike ?", "%orange%") if params[:color] == "orange"
      @clothes = @clothes.where("color ilike ?", "%purple%") if params[:color] == "purple"
      @clothes = @clothes.where("color ilike ?", "%red%") if params[:color] == "red"
      @clothes = @clothes.where("color ilike ?", "%yellow%") if params[:color] == "yellow"
      @clothes = @clothes.where("color ilike ?", "%white%") if params[:color] == "white"
    end
  end

  def filter_by_ascending
    if params[:price].present?
      @clothes = @clothes.order(price: :asc) if params[:price] == "ascending"
      @clothes = @clothes.order(price: :desc) if params[:price] == "descending"
    end
  end


    # if params[:size].present?
    #   @clothes = @clothes.where("size <= ?", 36) if small
    #   @clothes = @clothes.where("size >= ? and size <= ?", 38) if medium
    #   @clothes = @clothes.where("size >= ?", 40) if large

    # end
end
