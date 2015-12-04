class AddPriorityToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :priority, :integer
  end
end
