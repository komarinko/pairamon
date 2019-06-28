class RemoveUserFromPostsComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :user_id, :integer
  end
end
