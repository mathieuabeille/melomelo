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
    end
  end

  def gender_match?
    @wish.gender.present? && @cloth.gender.present?
    @cloth.gender.downcase == @wish.gender.downcase
  end

  def brand_match?
    @wish.brand.present? && @cloth.brand.present?
    @cloth.brand.downcase == @wish.brand.downcase
  end

  def price_match?
    @wish.price.present? && @cloth.price.present?
    min = @wish.price - 10
    max = @wish.price + 10
    (min..max).include?(@cloth.price)
  end

  def name_match?
    @wish.name.present? && @cloth.name.present?
    @cloth.name.downcase == @wish.name.downcase
  end

  def material_match?
    @wish.material.present? && @cloth.material.present?
    @cloth.material.downcase.include?(@wish.material.downcase)
  end

end
