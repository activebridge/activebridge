class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :hours
      t.date :date
      t.boolean :confirmed, default: false
      t.references :user
      t.references :customer

      t.timestamps
    end
  end
end
