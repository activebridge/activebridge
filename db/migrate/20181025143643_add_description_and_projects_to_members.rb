class AddDescriptionAndProjectsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :description, :string
    add_column :members, :projects, :string
  end
end
