class RemoveTitleFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :title, :string
  end
end
