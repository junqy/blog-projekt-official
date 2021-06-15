class RemovePasswordDigestFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :password_digest, :string
  end
end
