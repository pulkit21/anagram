class Prize < ApplicationRecord
  validates_presence_of :title, :description
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  # enum [:exact_number, :multiple_of]


  def distribution(prize)
    a = []
    a << prize_for_exact_numbers(prize)
    a << prize_for_multiple_of_500(prize)
    a << prize_for_multiple_of_50(prize)
    a
  end

  def prize_for_exact_numbers(prize)
    if [50, 100, 2000].include?(prize)
      return "won 1"
    end
  end

  def prize_for_multiple_of_500(prize)
    if prize % 500 == 0
      "won 2"
    end
  end

  def prize_for_multiple_of_50(prize)
    if (prize % 50 == 0) && prize > 1000
      "won 3"
    end
  end

end
