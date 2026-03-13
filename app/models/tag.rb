class Tag < ApplicationRecord

    #Table
    # t.string :name
    # t.string :tag_color, default: "#FF0000"

    #HM and BTM
    has_and_belongs_to_many :tasks

    #validations
    validates :name, presence: { message:"needed name" }


    
end
