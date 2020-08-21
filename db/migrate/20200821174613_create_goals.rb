class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :goal_title, null: false
      t.text :description, null: false
      t.boolean :completed, default: false
      t.boolean :public, default: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
