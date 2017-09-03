class AddConditionsToPrizes < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :condition, :integer
    add_column :prizes, :condition_one, :string
    add_column :prizes, :condition_two, :string
    add_column :prizes, :condition_three_multiple_of, :string
    add_column :prizes, :condition_three_greater_than, :string
  end
end
