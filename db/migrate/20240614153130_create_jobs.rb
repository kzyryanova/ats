class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.boolean :activated, default: false

      t.timestamps
    end
  end
end
