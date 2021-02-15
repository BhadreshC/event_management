class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.date :start_date
      t.date :end_date
      # t.belongs_to :user
      t.timestamps
    end
  end
end
