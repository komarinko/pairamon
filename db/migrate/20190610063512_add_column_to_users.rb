class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_manga, :string
    add_column :users, :fav_illust, :string
    add_column :users, :profile_image_id, :string
  end
end
