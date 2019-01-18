class AddFavsCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :favs_count, :integer
  end
end
