class AddWriterToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_comments, :writer, foreign_key: { to_table: :users }
  end
end
