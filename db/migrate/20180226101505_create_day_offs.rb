class CreateDayOffs < ActiveRecord::Migration[5.0]
  def change
    create_table :day_offs do |t|
      t.date :date
      t.references :user
      t.references :company
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
