class AddViewedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :viewed, :integer, default: 0
  end
end
