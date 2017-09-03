class AddPrizeReferencesToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :prize, foreign_key: true
  end
end
