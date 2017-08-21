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
      @clothes = @clothes.where(price: price_min..price_max)
      # @clothes = @clothes.where("price <= ?", 50) if params[:price].include? "low"
      # @clothes = @clothes.where("price >= ? and price < ?", 50, 150) if params[:price].include? "middle"
      # @clothes = @clothes.where("price >= ?", 150) if params[:price].include? "high"
    end
  end

  def filter_by_gender
    if params[:gender].present?
      @clothes = @clothes.where("gender ilike ?", "men") if params[:gender] == "men"
      @clothes = @clothes.where("gender ilike ?", "women") if params[:gender] == "women"
    end
  end

  def filter_by_color
    if params[:color].present?
      colors = params[:color].map { |color| "%#{color}%" }
      @clothes = @clothes.where("color ILIKE ANY ( array[?] )", colors)
      # @clothes = @clothes.where("color ilike ?", "%black%") if params[:color].include? "black"
      # @clothes = @clothes.where("color ilike ?", "%blue%") if params[:color].include?"blue"
      # @clothes = @clothes.where("color ilike ?", "%orange%") if params[:color].include?"orange"
      # @clothes = @clothes.where("color ilike ?", "%purple%") if params[:color].include?"purple"
      # @clothes = @clothes.where("color ilike ?", "%red%") if params[:color].include?"red"
      # @clothes = @clothes.where("color ilike ?", "%yellow%") if params[:color].include?"yellow"
      # @clothes = @clothes.where("color ilike ?", "%white%") if params[:color].include?"white"
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

  def price_min
    price_min = 0
    price_min = 150 if params[:price].include?("high")
    price_min = 50 if params[:price].include?("medium")
    price_min = 0 if params[:price].include?("low")
  end

  def price_max
    price_min = 50
    price_min = 99999 if params[:price].include?("high")
    price_min = 150 if params[:price].include?("medium")
    price_min = 50 if params[:price].include?("low")
  end
end
