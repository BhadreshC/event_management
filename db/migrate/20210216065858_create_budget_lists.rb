class CreateBudgetLists < ActiveRecord::Migration[6.1]
  def change
    create_table :budget_lists do |t|
      t.string :title
      t.integer :amount
      t.belongs_to :user
      t.timestamps
    end
  end
end
