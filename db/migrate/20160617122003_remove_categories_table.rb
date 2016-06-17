class RemoveCategoriesTable < ActiveRecord::Migration
  def change
    drop_table :categories
    remove_column :articles, :category_id, :integer
    add_column :articles, :category, :integer
  end
end
