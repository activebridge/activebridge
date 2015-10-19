class AddCartoonToMembers < ActiveRecord::Migration
  def change
    add_column :members, :cartoon, :string
  end
end
