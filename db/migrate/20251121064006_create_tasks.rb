class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :priority, default: 0  #enum
      t.integer :status, default: 0  #enum
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
