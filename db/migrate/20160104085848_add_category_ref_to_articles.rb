class AddCategoryRefToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :category, index: true, null: false
  end
end
