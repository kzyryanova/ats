class AddIndexToJobs < ActiveRecord::Migration[7.1]
  def change
    add_index :jobs, :activated
  end
end
