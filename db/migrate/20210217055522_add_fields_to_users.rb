class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    change_column :users, :number, :string
  end
end
