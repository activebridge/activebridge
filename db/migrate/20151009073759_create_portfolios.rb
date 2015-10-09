class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string  :title
      t.string  :description
      t.string  :logo
      t.string  :technology
      t.integer :duration
      t.integer :team_size
      t.string  :client
      t.string  :industry

      t.timestamps null: false
    end
  end
end
