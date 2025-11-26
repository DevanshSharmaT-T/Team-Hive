class RenameDescirptionToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :description, :description
  end
end