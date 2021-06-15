class RemovePublicFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :public, :boolean
  end
end
