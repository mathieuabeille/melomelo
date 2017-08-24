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
      @clothes = @clothes.where("gender ilike ?", "men") if params[:gender].include?("men")
      @clothes = @clothes.where("gender ilike ?", "women") if params[:gender].include?("women")
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

  def change_name
    @price = price_sort
  end

  def filter_by_ascending
    if params[:sort].present?
      @clothes = @clothes.order(price: :asc) if params[:sort] == "asc"
      @clothes = @clothes.order(price: :desc) if params[:sort] == "desc"
    end
  end


    # if params[:size].present?
    #   @clothes = @clothes.where("size <= ?", 36) if small
    #   @clothes = @clothes.where("size >= ? and size <= ?", 38) if medium
    #   @clothes = @clothes.where("size >= ?", 40) if large

    # end

  def price_min
    min = 0
    min = 150 if params[:price].include?("high")
    min = 50 if params[:price].include?("middle")
    min = 0 if params[:price].include?("low")
    min
  end

  def price_max
    max = 50
    max = 50 if params[:price].include?("low")
    max = 150 if params[:price].include?("middle")
    max = 99999 if params[:price].include?("high")
    max
  end
end
