class AddDefaultTextToPosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :body, :text, default: "Hello There"
  end
end
