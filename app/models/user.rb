class User < ApplicationRecord

  #Table
  # t.string :first_name, null: false
  # t.string :last_name, null: false
  # t.string :email, null: false, index: { unique: true }
  # t.references :manager, foreign_key: { to_table: :users }

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
  # validates_with UserValidator

end
