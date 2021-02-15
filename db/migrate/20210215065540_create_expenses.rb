class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.date :date
      t.integer :amount
      t.belongs_to :user
      t.timestamps
    end
  end
end
