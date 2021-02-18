class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string  :name
      t.bigint  :activeable_id
      t.string  :activeable_type
      t.timestamps
    end
  end
end
