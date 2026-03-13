class Comment < ApplicationRecord

  #Table
  # t.text :body, null: false
  # t.references :user, null: false, foreign_key: true
  # t.references :commentable, polymorphic: true, null: false

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  #validations
  validates :body, length:{ maximum: 200}, presence: {message: "Comment body needed"}
end
