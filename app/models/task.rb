class Task < ApplicationRecord

  #Table
  # t.string :title, null: false
  # t.text :description
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
  validates :title, :description, presence: { message: "needed feilds" }
  
  def set_defaults
    self.status ||= :backlog
    self.priority ||= :low
  end

  scope :tasks_for_project, -> (project) { where(project_id: project.id)
                                            .includes(:tags, :comments)
                                            .order(created_at: :desc)     }

end
