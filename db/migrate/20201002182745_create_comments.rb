class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false
      t.integer :author_id, null: false
      t.integer :commentable_id, null: false
      t.string :comment_type, null: false

      t.timestamps
      
    end

    add_index :comments, :author_id
    add_index :comments, :commentable_id
  end
end
