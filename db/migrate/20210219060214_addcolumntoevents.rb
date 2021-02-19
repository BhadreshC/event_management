class Addcolumntoevents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_fees, :decimal, precision: 10, scale: 2
    add_column :events, :paid, :boolean, default: false
    add_column :events, :event_type, :integer
    add_column :events, :event_link, :string
    add_column :events, :person_capicity, :integer
    add_column :events, :time_to_start, :time
    add_column :events, :event_category_id, :integer, null: :false
    add_index :events, :event_category_id
  end
end
