class CreateApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_events do |t|
      t.references :application, null: false, foreign_key: true
      t.string :type
      t.json :data
      t.timestamps
    end
  end
end
