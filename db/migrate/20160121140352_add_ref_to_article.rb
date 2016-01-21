class AddRefToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :user, index: true, foreign_key: true
  end
end
