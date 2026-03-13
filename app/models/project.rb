class Project < ApplicationRecord

    #Table
    # t.string :title, null: false
    # t.text :description
    # t.integer :status, default: 0 # enum
    # t.date :start_date
    # t.date :due_date
    # t.float :progress_percentage, default: 0.0

    #HMT
    has_many :assignments
    has_many :users, through: :assignments

    #HM
    has_many :tasks, dependent: :destroy

    #polymorphic
    has_many :comments, as: :commentable

    enum status: { selection: 0, draft: 1, initalize: 2, active: 3, deployed: 4 }

    #validations
    validates :title, :description, presence: { message: "Field needed" }

end