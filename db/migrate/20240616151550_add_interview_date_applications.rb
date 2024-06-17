class AddInterviewDateApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :interview_date, :datetime
  end
end
