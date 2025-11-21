class Assignment < ApplicationRecord

  #table
  # t.references :user, null: false, foreign_key: true
  # t.references :project, null: false, foreign_key: true
  # t.string :role, null: false
  # t.date :joined_project_at

  belongs_to :user
  belongs_to :project

  validates :user_id, uniqueness: { scope: :project_id, message: "is already on this project" }


end
