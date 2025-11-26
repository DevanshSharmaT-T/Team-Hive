class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Table
  # t.string :first_name, null: false
  # t.string :last_name, null: false
  # t.string :email, null: false, index: { unique: true }
  # t.references :manager, foreign_key: { to_table: :users }

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
    validates_with UserValidator

  scope :available_users_for_project, -> (project) { where.not( id: project.user_ids) }

end
