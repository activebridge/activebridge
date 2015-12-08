class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :body
      t.integer :review_status, default: 0

      t.timestamps null: false
    end
  end
end
