class AddIndexToApplications < ActiveRecord::Migration[7.1]
  def change
    add_index :application_events, :type
    add_index :application_events, :created_at
  end
end
