class AddPriorityToMembers < ActiveRecord::Migration
  def change
    add_column :members, :priority, :integer
  end
end
