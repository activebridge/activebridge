class AddMetaTitleToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :meta_title, :string
  end
end
