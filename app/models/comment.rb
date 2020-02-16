class Comment < ApplicationRecord
    validates_presence_of :name, :comment
    belongs_to :picture
end
