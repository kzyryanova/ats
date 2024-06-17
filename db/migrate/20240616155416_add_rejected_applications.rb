class AddRejectedApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :rejected, :boolean
  end
end
