class AddChallengAndSolutionToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :challenge, :string
    add_column :projects, :solution, :string
  end
end
