class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :title
      t.string  :description
      t.string  :logo
      t.string  :technology
      t.integer :duration
      t.integer :team_size
      t.string  :client
      t.string  :industry
      t.string  :link

      t.timestamps null: false
    end
  end
end
