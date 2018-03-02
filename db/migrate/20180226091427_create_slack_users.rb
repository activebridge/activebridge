class CreateSlackUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :slack_name
      t.string :status
      t.string :slack_id
      t.string :role
      t.boolean :deleted, default: false
      t.references :company

      t.timestamps
    end
  end
end
