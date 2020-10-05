class Goal < ApplicationRecord
    validates :user_id, :goal_title, :description, presence: true
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy

    def is_private?
        !self.public?
    end
end