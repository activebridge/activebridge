class AddMemberIndexToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :member_id, :integer, index: true
    add_foreign_key :articles, :members
  end
end
