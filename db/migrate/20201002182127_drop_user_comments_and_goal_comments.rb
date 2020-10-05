class DropUserCommentsAndGoalComments < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_comments
    drop_table :goal_comments
  end
end
