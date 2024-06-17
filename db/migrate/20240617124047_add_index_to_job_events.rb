class AddIndexToJobs < ActiveRecord::Migration[7.1]
  def change
    add_index :job_events, :type
    add_index :job_events, :created_at
  end
end
