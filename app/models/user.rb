class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Table
  # t.string "first_name", null: false
  # t.string "last_name", null: false
  # t.string "email", null: false
  # t.integer "manager_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.string "job_title"
  # t.string "encrypted_password", default: "", null: false
  # t.string "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.string "confirmation_token"
  # t.datetime "confirmed_at"
  # t.datetime "confirmation_sent_at"
  # t.string "unconfirmed_email"
  # t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  # t.index ["email"], name: "index_users_on_email", unique: true
  # t.index ["manager_id"], name: "index_users_on_manager_id"
  # t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  devise :database_authenticatable, :registerable, :recoverable, stretches: 13   # , :confirmable
  
  #HMT
  has_many :assignments
  has_many :projects, through: :assignments

  #polymorphic
  has_many :comments

  #self join-to 
  belongs_to :manager, class_name: "User", optional: true
  has_many :subordinates,  class_name: "User", foreign_key: "manager_id"

  #validations
    validates :first_name, :last_name, :email, presence: true
    validates :email,
      uniqueness: { message: "Alredy exist" },
      format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Invalid Email" }
    validates :password, format: { with: /\A(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9]).{8}\z/, message: "Password must be strong and have two uppercase letters, has one special case letter, has two digits with minimum length 8."}
    validates_with UserValidator

  scope :available_users_for_project, -> (project) { where.not( id: project.user_ids) }

end
