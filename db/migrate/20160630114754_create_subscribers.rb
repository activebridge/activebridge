class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
