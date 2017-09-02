class Prize < ApplicationRecord
  validates_presence_of :title, :description
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
end
