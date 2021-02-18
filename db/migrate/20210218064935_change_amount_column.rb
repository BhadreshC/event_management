class ChangeAmountColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :budget_lists, :amount, :decimal, precision: 10, scale: 2
    change_column :expenses, :amount, :decimal, precision: 10, scale: 2
  end
end
