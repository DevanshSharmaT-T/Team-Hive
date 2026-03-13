class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :tag_color, default: "#FF0000"

      t.timestamps
    end
  end
end
