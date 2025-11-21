class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, default: 0 # enum
      t.date :start_date
      t.date :due_date
      t.float :progress_percentage, default: 0.0

      t.timestamps
    end
  end
end
