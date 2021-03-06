class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string  :name, index: true
      t.string  :position
      t.string  :avatar
      t.string  :careers
      t.string  :github
      t.string  :linkedin

      t.timestamps null: false
    end
  end
end
