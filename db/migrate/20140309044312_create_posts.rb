class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.text    :body
      t.integer :user_id

      t.timestamps
    end

    add_index :posts, :title, unique:  true
    add_index :posts, :user_id
  end
end
