class Task < ApplicationRecord

  #Table
  # t.string :title, null: false
  # t.text :descirption
  # t.integer :priority, default: 0  #enum
  # t.integer :status, default: 0  #enum
  # t.references :project, null: false, foreign_key: true

  belongs_to :project

  #HM and BTM
  has_and_belongs_to_many :tags

  has_many :comments, as: :commentable

  enum priority: { low: 0, medium: 1, high: 2}
  enum status: { backlog: 0, in_progress: 1, done: 2 }

  #validations
  validates :title, :descirption, presence: { message: "needed feilds" }
  


end
