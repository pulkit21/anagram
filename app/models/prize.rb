class Prize < ApplicationRecord
  validates_presence_of :title, :description
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  enum condition: { "Exact Numbers" => 0, "Multiple Of" => 1, "Multiple Of and Greater Than" => 2 }


  def exact_number_rule
    self.condition == "Exact Numbers"
    prize_for_exact_numbers(prize)
  end

  def multiple_of_rule
    self.condition == "Multiple Of"
  end

  def multiple_of_greater_than_rule
    self.condition == "Multiple Of and Greater Than"
  end

  def distribution(prize)
    a = []
    a << prize_for_exact_numbers(prize) if exact_number_rule
    a << prize_for_multiple_of_500(prize) if multiple_of_rule
    a << prize_for_multiple_of_50(prize)  if multiple_of_greater_than_rule
    a
  end

  def prize_for_exact_numbers(prize)
    if self.condition_one.split(",").map(&:to_i).include?(prize)
      return "won 1"
    end
  end

  def prize_for_multiple_of_500(prize)
    if prize % self.condition_two.to_i == 0
      "won 2"
    end
  end

  def prize_for_multiple_of_50(prize)
    if (prize % self.condition_three_multiple_of.to_i == 0) && prize > self.condition_three_greater_than.to_i
      "won 3"
    end
  end

end
