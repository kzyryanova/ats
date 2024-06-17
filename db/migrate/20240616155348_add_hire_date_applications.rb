class AddHireDateApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :hire_date, :datetime
  end
end
