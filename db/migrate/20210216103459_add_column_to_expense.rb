class AddColumnToExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :event_id, :integer, null: :false
    add_index :expenses, :event_id
    add_column :budget_lists, :event_id, :integer, null: :false
    add_index :budget_lists, :event_id
  end
end