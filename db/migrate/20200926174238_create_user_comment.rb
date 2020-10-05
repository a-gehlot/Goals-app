class CreateUserComment < ActiveRecord::Migration[6.0]
  def change
    create_table :user_comments do |t|
      t.integer :user_id, null: false
      t.integer :author_id, null: false
      t.text :comment, null: false
    end

    add_index :user_comments, :user_id
  end
end
