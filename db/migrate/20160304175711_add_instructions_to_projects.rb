class AddInstructionsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :instructions, :text
  end
end
