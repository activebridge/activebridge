class RemoveLinksAndCartoonFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :careers
    remove_column :members, :github
    remove_column :members, :linkedin
    remove_column :members, :cartoon
  end
end
