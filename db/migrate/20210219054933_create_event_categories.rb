class CreateEventCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :event_categories do |t|
      t.string :public_name
      t.string :private_name
      t.integer :status
      # t.timestamps
    end
  end
end
