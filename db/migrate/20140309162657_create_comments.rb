class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    :text, null: false
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
