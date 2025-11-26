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
    validates :title, :description, :due_date, presence: { message: "Field needed" }
    validate :valid_due_dates

    def percent_complete
        if tasks.none?
            return 0
        end 
        ((tasks.done.count.to_f / tasks.count) * 100).round
    end

    def valid_due_dates
        return if due_date.blank?
        errors.add(:due_date, "due date should be greater than start date.") if due_date.to_date <= start_date.to_date
    end

    scope :newest_projects_in_order, -> { includes(:tasks).order(created_at: :desc) }
    

end