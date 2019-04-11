class RemoveDescriptionFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :description
  end
end
