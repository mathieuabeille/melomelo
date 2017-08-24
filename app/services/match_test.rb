class MatchTest

  def initialize(cloth, wish)
    @cloth = cloth
    @wish = wish
  end

  def match?
    nb = 0
    nb += 1 if color_match?
    nb += 1 if brand_match?
    nb += 1 if price_match?
    nb += 1 if gender_match?
    nb += 1 if name_match?
    nb += 1 if material_match?
    return true if nb > 1
  end

  def color_match?
    if @wish.color.present? && @cloth.color.present?
      @cloth.color.downcase.include?(@wish.color.downcase)
    else
      true
    end
  end

  def gender_match?
    if @wish.gender.present? && @cloth.gender.present?
      @cloth.gender.downcase == @wish.gender.downcase
    else
      true
    end
  end

  def brand_match?
    if @wish.brand.present? && @cloth.brand.present?
      @cloth.brand.downcase == @wish.brand.downcase
    else
      true
    end
  end

  def price_match?
    if @wish.price.present? && @cloth.price.present?
      min = @wish.price - 10
      max = @wish.price + 10
      (min..max).include?(@cloth.price)
    else
      true
    end
  end

  def name_match?
    if @wish.name.present? && @cloth.name.present?
      @cloth.name.downcase.include?(@wish.name.downcase)
    else
      true
    end
  end

  def material_match?
    if @wish.material.present? && @cloth.material.present?
      @cloth.material.downcase.include?(@wish.material.downcase)
    else
      true
    end
  end
end
