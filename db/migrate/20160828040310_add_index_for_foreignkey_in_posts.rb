class AddIndexForForeignkeyInPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts, :user_id
    change_column :posts, :user_id, :integer, null: false
  end
end
