class AddDefaultToPosts < ActiveRecord::Migration[5.2]
  def change
  change_column_default :posts, :favs_count, 0
  end
end
