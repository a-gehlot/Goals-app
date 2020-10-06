class Goal < ApplicationRecord
    include Commentable
    
    validates :user_id, :goal_title, :description, presence: true
    belongs_to :user

    def is_private?
        !self.public?
    end
end