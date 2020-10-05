class CreateGoalComment < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id, null: false
      t.integer :author_id, null: false
      t.text :comment, null: false

    end

    add_index :goal_comments, :goal_id
  end
end
