class AddHeadNumberToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :head_number, :bigint
  end
end
