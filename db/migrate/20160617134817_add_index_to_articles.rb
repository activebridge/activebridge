class AddIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :category
  end
end
