class Shop

  def initialize
    @sku = {
      "A" => 50,
      "B" => 30,
      "C" => 20,
      "D" => 15
    }
    @valid_items = "ABCD"
    @discount_a = 0
    @discount_b = 0
  end

  def checkout(list)
    sub_total = 0
    return -1 if invalid_check(list)
    list.to_s.chars { |item| @sku.each { |i, price| sub_total += price if i == item }
      discount_tracker(item)
    }
    sub_total -= discount_calc
  end

  private

  def reset_discounts
    @discount_a = 0
    @discount_b = 0
  end

  def discount_calc
    d = (20 * (@discount_a / 3)) + (15 * (@discount_b / 2))
    reset_discounts
    d
  end

  def invalid_check(list)
    !list.to_s.chars.all? { |item| @valid_items.include? item }
  end

  def discount_tracker(item)
    @discount_a += 1 if item == "A"
    @discount_b += 1 if item == "B"
  end
end
