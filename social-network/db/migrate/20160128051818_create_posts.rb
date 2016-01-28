class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    #adding this so we can sort posts in DESC order
    add_index :posts, [:user_id, :created_at]
  end
end
